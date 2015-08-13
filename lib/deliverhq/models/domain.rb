module Deliverhq
  class Domain < ModelBase

    def self.create(params)
      new(Request::Domain.create(params))
    end

    def self.all
      Request::Domain.list.collect do |domain|
        new domain
      end
    end

    def destroy
      Request::Domain.destroy(id)
    end

  end
end
