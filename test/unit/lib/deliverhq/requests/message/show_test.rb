require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MessageShowTest < Minitest::Test

      def setup
        @response = {
            'id' => 1234,
            'body' => 'foo'
          }
      end

      def test_show
        Base.stub :get, @response, [1234] do
          assert_equal 'foo', Request::Message.show(1234)['body']
        end
      end
      
    end
  end
end
