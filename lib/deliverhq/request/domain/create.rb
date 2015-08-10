# POST /domains
# name: "foo.com"
module Deliverhq
  module Request
    class Domain < Base
      def self.create(params)
        post('domain', *params)
        true
      end
    end
  end
end
