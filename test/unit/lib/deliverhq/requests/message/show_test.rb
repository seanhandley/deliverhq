require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MessageShowTest < Minitest::Test

      def setup
        @message_show_response = {
            'id' => 1234,
            'body' => 'foo'
          }
      end

      def test_show
        Base.stub :get, @message_show_response, ["messages/1234"] do
          assert_equal 'foo', Request::Message.show(1234)['body']
        end
      end
      
    end
  end
end
