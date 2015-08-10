require_relative '../../../../../test_helper'

module Deliverhq
  module Request
    class MailboxCreateTest < Minitest::Test

      def setup
        @mailbox_params = {
          'name' => 'foo'
        }
        @response = {
          'id' => 1234
        }
      end

      def test_create_returns_mailbox
        Base.stub :post, @response do
          assert_equal 1234, Request::Mailbox.create(@mailbox_params)['id']
        end
      end
      
    end
  end
end
