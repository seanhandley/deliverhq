# GET /domains
module Deliverhq
  module Request
    class Mailbox < Base
      def self.list
        get('mailboxes')
      end
    end
  end
end
