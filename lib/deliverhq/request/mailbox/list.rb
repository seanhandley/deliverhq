# GET /mailboxes
module Deliverhq
  module Request
    class Mailbox < Base
      def self.list
        http_get('mailboxes')
      end
    end
  end
end
