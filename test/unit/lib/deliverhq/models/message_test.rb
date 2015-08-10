module Deliverhq
  
  require_relative '../../../../test_helper'
  
  class MessageTest < Minitest::Test
    def setup
      @message_response = {
            'id' => 1234,
            'body' => 'foo'
          }
      @message = Message.new(@message_response)
    end
    
    def test_find
      Request::Message.stub(:get, @message_response) do
        assert_equal Message.find(1234).body, @message.body
      end
    end

    def test_all
      Request::Message.stub(:get, {'records' => [@message_response]}) do
        assert_equal Message.all.first.id, @message.id
      end
    end
  end
end