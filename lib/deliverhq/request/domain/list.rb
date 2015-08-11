# GET /domains
module Deliverhq
  module Request
    class Domain < Base
      def self.list
        http_get('domains')
      end
    end
  end
end
