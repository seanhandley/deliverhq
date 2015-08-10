require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class DomainListTest < Minitest::Test

      def setup
        @response = [{
            'account_id' => 1,
            'name' => 'foo.com',
            'id' => 1234,
            'verification_token' => "54321",
            'verified_at' => nil
          }]
      end

      def test_list
        Base.stub :get, @response do
          assert_equal 1, Request::Domain.list.count
        end
      end
      
    end
  end
end
