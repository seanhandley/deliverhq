# GET /message/:id
module Deliverhq
  module Request
    class Message < Base
      def self.show(id)
        get("messages/#{id}")
      end
    end
  end
end
