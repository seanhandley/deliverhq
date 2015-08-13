module Deliverhq
  class ModelBase
    def initialize(params)
      self.class.class_eval do
        attr_reader *params.keys.map(&:to_sym)
      end
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
    