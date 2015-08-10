module Deliverhq
  class Response
    
    attr_reader :body
    
    def initialize(server_response)
      if server_response.status == 200
        @body = JSON.parse(server_response.body)
      else
        raise "Server responded with #{server_response.status}: #{server_response.body}"
      end
    end
    
  end
end
