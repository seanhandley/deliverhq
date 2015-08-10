module Deliverhq
  class Domain
    
    attr_reader :id

    def initialize(params)
      @id = params['id']
    end

  end
end
