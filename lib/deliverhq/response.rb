module Deliverhq
  class Response
    
    attr_reader :body
    
    def initialize(server_response)
      if server_response.status == 200
        @body = server_response.body.strip.length > 0 ? JSON.parse(server_response.body) : server_response.body
      else
        raise RequestError, "Server responded with #{server_response.status}: #{server_response.body}"
      end
    end
    
  end
end
