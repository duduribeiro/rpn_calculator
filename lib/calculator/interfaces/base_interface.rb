module Interfaces
  class BaseInterface
    def initialize(options = {})
      @engine = options[:engine]
    end

    private

    attr_reader :engine

    def custom_operations
      {}
    end

    def process_custom_operator(input)
      operator = custom_operations[input.operator_key]
      operator && operator.execute
    end

    def process_input(input)
      process_custom_operator(input) || engine.process_input(input)
    end
  end
end
