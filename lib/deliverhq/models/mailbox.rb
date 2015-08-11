module Deliverhq
  class Mailbox
    
    attr_reader :id, :name, :check_spam, :destination_address,
                :destination_type, :domain_id, :encoding, :format,
                :reply_stripping, :partial_address,
                :account_id, :server_id, :domain,
                :address, :created_at, :forwarding_token,
                :verification_token,:verified_at

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
      @account_id = params["account_id"]
      @server_id = params["server_id"]
      @domain = params["domain"]
      @address = params["address"]
      @created_at = params["created_at"]
      @forwarding_token = params["forwarding_token"]
      @verification_token = params["verification_token"]
      @verified_at = params["verified_at"]
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
