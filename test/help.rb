require 'test/unit'
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rbet'
require 'webrick'
require 'thread'
require 'rubygems'

require 'nokogiri'

# shut up, webrick :-)
class ::WEBrick::HTTPServer
  def access_log(config, req, res)
    # nop
  end
end
class ::WEBrick::BasicLog
  def log(level, data)
    # nop
  end
end

class RBETService
  include RBET::Renderable
  def initialize
    set_template_path( File.join(File.dirname(__FILE__), "templates") )
  end
end

class DiagnosticsService < RBETService
  def ping(params)
    render_template("diagnostics_ping_success")
  end
end

class ListService < RBETService
  def add(params)
    list_type = params['list_type']
    if list_type != 'private' and list_type != 'public'
      render_template("list_add_failure")
    else
      render_template("list_add_success")
    end
  end

  def retrieve(params)
    render_template("list_retrieve_all_success")
  end
end

class SubscriberService < RBETService

  def retrieve(params)
    if params['search_value2']
      @email = params['search_value2']
      render_template("subscriber_retrieve_success")
    else
      render_template("subscriber_retrieve_failed")
    end
  end

end

# list for subscriber requests and respond like ET would
class SubscriberRBETService < ::WEBrick::HTTPServlet::AbstractServlet

  def do_POST(req, res)

    xml_body = String.new(req.body)
    xml_body.gsub!(/qf=xml&xml=/,'')

    doc = Nokogiri::XML::Document.parse(CGI::unescape(xml_body))
    system = doc.xpath("//system")
    system_name = system.xpath("./system_name").text.strip.downcase
    action = system.xpath("./action").text.strip.downcase

    params = {}
    # load all the system parameters into a hash
    system.children.each do|element|
      next unless element.elem?
      params[element.name] = element.text.strip
    end

    response = service_for(system_name).send(action, params)

    res.body = %Q(<?xml version="1.0" ?>
<exacttarget>
#{response}
</exacttarget>)

    # got rid of this, was breaking the test server
    # res['Content-Type'] = "text/xml"
    res
  end

private
  def service_for(system_name)
    eval("#{system_name.capitalize}Service.new")  #render_template("#{system_name}_#{action}_success")
  end

end

module RBET
  module TestCase

    def setup
      # create the server
      @server = WEBrick::HTTPServer.new({:BindAddress => "localhost", :Port => 9999})

      # setup test server (simulates exact target)
      @server.mount("/test/", SubscriberRBETService)

      # start up the server in a background thread
      @thread = Thread.new(@server) do|server|
        server.start
      end
    end

    def teardown
      @server.shutdown
      #@thread.join
    end

  end
end
