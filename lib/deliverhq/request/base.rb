module Deliverhq
  # @private
  module Request
    API_BASE_URL = 'https://api.deliverhq.com'
    class Base

      def self.get(url, params={})
        Response.new(conn.get(url, params)).body
      end
      
      def self.post(url, params={})
        response = Response.new(conn.post(url, params))
        response.body
      end

      def self.delete(url, params={})
        response = Response.new(conn.delete(url, params))
        response.body
      end
      
      private
      
      def self.conn
        Faraday.new(:url => API_BASE_URL) do |faraday|
          faraday.path_prefix = "/api"
          faraday.request  :url_encoded
          faraday.headers['Content-Type'] = 'application/json'
          faraday.basic_auth(ENV['DELIVERHQ_ID'], ENV['DELIVERHQ_KEY'])
          # faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end
      end
      
    end
  end
end
