require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MailboxListTest < Minitest::Test

      def setup
        @mailbox_list_response = [{
            'name' => 'foo'
          }]
      end

      def test_list
        Deliverhq::Request::Base.stub :http_get, @mailbox_list_response, ["mailboxes"] do
          assert_equal 1, Request::Mailbox.list.count
        end
      end
      
    end
  end
end
