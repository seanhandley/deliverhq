# GET /messages
module Deliverhq
  module Request
    class Message < Base
      def self.list(page=1)
        get('messages', page: page)['records']
      end
    end
  end
end
