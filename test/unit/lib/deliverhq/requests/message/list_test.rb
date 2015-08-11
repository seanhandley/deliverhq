require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MessageListTest < Minitest::Test

      def setup
        @message_list_response = {'records' => [{
            'id' => 1234,
            'body' => 'foo'
          }]}
      end

      def test_list
        Base.stub :get, @message_list_response, ["messages", {page: 1}] do
          assert_equal 1, Request::Message.list(1).count
        end
      end
      
    end
  end
end
