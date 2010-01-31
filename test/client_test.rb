require File.join(File.dirname(__FILE__),"help.rb")

class TestClient  < Test::Unit::TestCase
  include RBET::TestCase

  def test_client_send_ping
    client = RBET::Client.new('tester','tester11', {:service_url => 'http://127.0.0.1:9999/test/', :use_ssl => false})
    result = client.send do|io|
      io << %q(<system>
                <system_name>diagnostics</system_name>
                <action>Ping</action>
               </system>)
    end
    assert_equal Net::HTTPOK, result.class
    assert_match /<Ping>Running<\/Ping>/, result.body
  end

end
