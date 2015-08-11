require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class DomainCreateTest < Minitest::Test

      def setup
        @params = {name: 'foo.com'}
        @domain_create_response = {
            'account_id' => 1,
            'name' => 'foo.com',
            'id' => 1234,
            'verification_token' => "54321",
            'verified_at' => nil
          }
      end

      def test_create_returns_domain
        Base.stub :post, @domain_create_response, ["domains", @params.to_json] do
          assert_equal 1234, Request::Domain.create(@params)['id']
        end
      end
      
    end
  end
end
