module Deliverhq
  
  require_relative '../../../../test_helper'
  
  class MailboxTest < Minitest::Test
    def setup
      @mailbox_params = {'name' => 'foo'}
      @mailbox_response = {'id' => 1234}
      @mailbox = Mailbox.new(@mailbox_response)
    end
    
    def test_create
      Request::Mailbox.stub(:create, @mailbox_response) do
        assert_equal Mailbox.create(@mailbox_params).id, @mailbox.id
      end
    end

    def test_all
      Request::Mailbox.stub(:list, [@mailbox_response]) do
        assert_equal Mailbox.all.first.id, @mailbox.id
      end
    end

    def test_destroy
      Request::Mailbox.stub(:destroy, true) do
        assert @mailbox.destroy
      end
    end
  end
end