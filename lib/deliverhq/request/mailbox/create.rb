# PUT /mailboxes
# name: Incoming Support
# check_spam: 0
# destination_address : http://app.sirportly.com/modules/deliver2/accept
# destination_type: http
# domain_id: 99
# encoding: post
# format: full
# reply_stripping: false
# partial_address: support
module Deliverhq
  module Request
    class Mailbox < Base
      def self.create(params)
        post('mailboxes', params.to_json)
      end
    end
  end
end
