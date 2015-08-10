# POST /domains
# name: "foo.com"
module Deliverhq
  module Request
    class Domain < Base
      def self.create(params)
        post('domains', *params)
      end
    end
  end
end
