#
# Copyright (c) 2008 Shanti A. Braford
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'rubygems'
require 'hpricot'

module ET

  #
  # usage:
  #
  #   # First load the Tracker client
  #   tracker_client = ET::Tracker.new('username', 'password')
  #
  #   # get job summary
  #   summary = job_client.retrieve_summary(12345) # pass a job_id
  #   => {'sentCount' => 163, 'deliveredCount' => 159, ... }
  #
  #
  class TriggeredSend < Client

    def initialize(username, password, options={})
      super
    end

    # retrieves tracking information for a particular job id
    def add_subscriber( email, external_key, attributes={} )
      @email = email
      @external_key = external_key
      @attributes = attributes
      raise "external_key can't be nil" unless @external_key
      response = send do|io|
        io << render_template('triggered_send')
      end
      Error.check_response_error(response)
      # doc = Hpricot.XML(response.read_body)
      # doc.at("subscriber_description").inner_html.to_i
    end

  end
end
