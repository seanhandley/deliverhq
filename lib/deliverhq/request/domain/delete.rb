# DELETE /domains/id
module Deliverhq
  module Request
    class Domain < Base
      def self.delete(id)
        delete('domains', id: id)
        true
      end
    end
  end
end
