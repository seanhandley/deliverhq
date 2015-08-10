module Deliverhq
  class Response
    
    attr_reader :body
    
    def initialize(server_response)
      @body = JSON.parse(server_response.body)
    end
    
  end
end
