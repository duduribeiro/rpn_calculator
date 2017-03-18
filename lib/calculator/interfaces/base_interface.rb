module Interfaces
  class BaseInterface
    def initialize(options = {})
      @engine = options[:engine]
    end

    private

    attr_reader :engine

    def process_custom_operator
      nil
    end

    def process_input(input)
      process_custom_operator or engine.process_input(input)
    end
  end
end
