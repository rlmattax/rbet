require File.join(File.dirname(__FILE__),"help.rb")

class ListClient  < Test::Unit::TestCase
  include RBET::TestCase
  def setup
    super
    @client = RBET::List.new('tester','tester11', :service_url => 'http://127.0.0.1:9999/test/', :use_ssl => false, :debug_output => $stderr)
  end

  def test_list_all
    @client.all
  end

  def test_list_add
    @client.add('sample list')
  end

end
