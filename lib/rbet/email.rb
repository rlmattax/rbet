require "builder/xmlmarkup.rb"

module RBET
  class Email < Client
    attr_reader :username, :password, :headers

    def initialize(username,password,options={})
      super
      @attributes = {}
    end

    def add(email_name, email_subject_line, email_body)
      @email_name         = email_name
      @email_subject_line = email_subject_line
      @email_body         = email_body

      data = ""
      xml = Builder::XmlMarkup.new(:target => data, :indent => 2)
      xml.system do
        xml.system_name "email"
        xml.action      "add"
        xml.sub_action  "HTMLPaste"
        # xml.category 
        xml.email_name      email_name
        xml.email_subject   email_subject_line
        xml.email_body      email_body          #"<![CDATA[%s]]>"%email_body
      end
      
      response = send do|io|
        io << data
      end
      
      Error.check_response_error(response)
      doc = Hpricot.XML( response.read_body )

      (doc/"emailID").inner_html.to_i
    end

  end
end