require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MailboxCreateTest < Minitest::Test

      def setup
        @mailbox_create_params = {
          'name' => 'foo'
        }
        @mailbox_create_response = {
          'id' => 1234
        }
      end

      def test_create_returns_mailbox
        Base.stub :post, @mailbox_create_response, ["mailboxes", @mailbox_create_params.to_json] do
          assert_equal 1234, Request::Mailbox.create(@mailbox_create_params)['id']
        end
      end
      
    end
  end
end
