# DELETE /domains/id
module Deliverhq
  module Request
    class Domain < Base
      def self.destroy(id)
        http_delete("domains/#{id}")
        true
      end
    end
  end
end
