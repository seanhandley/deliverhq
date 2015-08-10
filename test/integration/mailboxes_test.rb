require_relative '../test_helper'
require_relative '../integration_test_helper'

module Deliverhq
  class MailboxesTest < Minitest::Test
    
    def setup
      @mailbox_params = {
        'name' => 'Incoming Support',
        'check_spam' => 0,
        'destination_address' => 'http://app.sirportly.com/modules/deliver2/accept',
        'destination_type' => 'http',
        'domain_id' => 6707,
        'encoding' => 'post',
        'format' => 'full',
        'reply_stripping' => false,
        'partial_address' => 'support'
      }
    end
    
    def test_create_list_and_delete_mailboxes
      VCR.use_cassette('crd_mailboxes') do
        mailbox_count = Mailbox.all.count
        mailbox = Mailbox.create(@mailbox_params)
        assert_equal mailbox.name, @mailbox_params['name']
        assert_equal mailbox_count+1, Mailbox.all.count
        assert mailbox.destroy
        assert_equal mailbox_count, Mailbox.all.count
      end
    end
  
  end
end
