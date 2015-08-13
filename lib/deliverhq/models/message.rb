module Deliverhq
  class Message < ModelBase

    def self.find(id)
      new(Request::Message.show(id))
    end

    def self.all(page=1)
      Request::Message.list(page).collect do |message|
        new message
      end
    end

  end
end
