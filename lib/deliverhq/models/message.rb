module Deliverhq
  class Message
    
    attr_reader :id, :envelope_to, :envelope_from,
                :subject, :status, :error, :server_id,
                :mailbox_id, :status_code, :body,
                :bounce_body, :spam, :address_identifier,
                :body_to, :body_from

    def initialize(params)
      @id = params["id"]
      @envelope_to = params["envelope_to"]
      @envelope_from = params[ "envelope_from"]
      @subject = params["subject"]
      @status = params["status"]
      @error = params["error"]
      @server_id = params[ "server_id"]
      @mailbox_id = params[ "mailbox_id"]
      @status_code = params[ "status_code"]
      @body = params[ "body"]
      @bounce_body = params[ "bounce_body"]
      @spam = params[ "spam"]
      @address_identifier = params["address_identifier"]
      @body_to = params[ "body_to"]
      @body_from = params[ "body_from"]
    end

    def self.find(id)
      new(Request::Message.show(id))
    end

    def self.all(page=1)
      Request::Message.list(page).collect do |message|
        new message
      end
    end

  end
end
