require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MessageListTest < Minitest::Test

      def setup
        @response = {'records' => [{
            'id' => 1234,
            'body' => 'foo'
          }]}
      end

      def test_list
        Base.stub :get, @response do
          assert_equal 1, Request::Message.list.count
        end
      end
      
    end
  end
end
