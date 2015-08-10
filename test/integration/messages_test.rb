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

    def test_show_message
      VCR.use_cassette('messages_show') do
        assert_equal "kevin.deamandel@gmail.com", Message.find(220376981).envelope_to
      end
    end
  
  end
end
