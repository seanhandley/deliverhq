require_relative '../test_helper'
require_relative '../integration_test_helper'

module Deliverhq
  class MessagesTest < Minitest::Test
    
    def setup
      @message_id = 1
    end
    
    def test_list_messages
      VCR.use_cassette('messages_list') do
        assert_equal 4, Message.all.count
      end
    end
  
  end
end
