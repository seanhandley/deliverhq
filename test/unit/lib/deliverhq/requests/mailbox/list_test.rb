require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MailboxListTest < Minitest::Test

      def setup
        @response = [{
            'name' => 'foo'
          }]
      end

      def test_list
        Base.stub :get, @response do
          assert_equal 1, Request::Mailbox.list.count
        end
      end
      
    end
  end
end
