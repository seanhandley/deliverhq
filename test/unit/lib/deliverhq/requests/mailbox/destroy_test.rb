require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MailboxDestroyTest < Minitest::Test

      def setup
        @mailbox_destroy_response = " "
      end

      def test_destroy_returns_true
        Deliverhq::Request::Base.stub :http_delete, @mailbox_destroy_response, ["mailboxes/1234"] do
          assert Request::Mailbox.destroy(1234)
        end
      end
      
    end
  end
end
