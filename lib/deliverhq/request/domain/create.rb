# POST /domains
# name: "foo.com"
module Deliverhq
  module Request
    class Domain < Base
      def self.create(params)
        http_post('domains', params.to_json)
      end
    end
  end
end
