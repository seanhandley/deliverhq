# DELETE /mailboxes/id
module Deliverhq
  module Request
    class Mailbox < Base
      def self.destroy(id)
        http_delete("mailboxes/#{id}")
        true
      end
    end
  end
end
