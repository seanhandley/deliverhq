require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class DomainDestroyTest < Minitest::Test

      def setup
        @domain_destroy_response = " "
      end

      def test_destroy_returns_true
        Base.stub :delete, @domain_destroy_response, ["domains/1234"] do
          assert Request::Domain.destroy(1234)
        end
      end
      
    end
  end
end
