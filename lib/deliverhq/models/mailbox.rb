module Deliverhq
  class Mailbox < ModelBase

    def self.create(params)
      new(Request::Mailbox.create(params))
    end

    def self.all
      Request::Mailbox.list.collect do |mailbox|
        new mailbox
      end
    end

    def destroy
      Request::Mailbox.destroy(id)
    end

  end
end
