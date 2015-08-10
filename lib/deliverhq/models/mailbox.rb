module Deliverhq
  class Mailbox
    
    attr_reader :id, :name, :check_spam, :destination_address,
                :destination_type, :domain_id, :encoding, :format,
                :reply_stripping, :partial_address

    def initialize(params)
      @id = params['id']
      @name = params['name']
      @check_spam = params["check_spam"]
      @destination_address = params["destination_address"]
      @destination_type = params["destination_type"]
      @domain_id = params["domain_id"]
      @encoding = params["encoding"]
      @format = params["format"]
      @reply_stripping = params["reply_stripping"]
      @partial_address = params["partial_address"]
    end

    def self.create(params)
      new(Request::Mailbox.create(params))
    end

    def self.all
      Request::Mailbox.list.collect do |mailbox|
        new mailbox
      end
    end

    def destroy
      Request::Mailbox.destroy(id)
    end

  end
end
