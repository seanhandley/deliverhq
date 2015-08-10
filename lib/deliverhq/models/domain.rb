module Deliverhq
  class Domain
    
    attr_reader :id, :account_id, :name, :verification_token, :verified_at

    def initialize(params)
      @id = params['id']
      @account_id = params['account_id']
      @name = params['name']
      @verification_token = params['verification_token']
      @verified_at = params['verified_at']
    end

    def self.create(params)
      new(Request::Domain.create(params))
    end

  end
end
