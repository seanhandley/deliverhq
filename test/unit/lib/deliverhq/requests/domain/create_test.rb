require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class DomainCreateTest < Minitest::Test

      def setup
        @response = {
            'account_id' => 1,
            'name' => 'foo.com',
            'id' => 1234,
            'verification_token' => "54321",
            'verified_at' => nil
          }
      end

      def test_create_returns_domain
        Base.stub :post, @response do
          assert_equal 1234, Request::Domain.create(name: 'foo.com')['id']
        end
      end
      
    end
  end
end
