# GET /domains
module Deliverhq
  module Request
    class Domain < Base
      def self.list
        get('domains')
      end
    end
  end
end
