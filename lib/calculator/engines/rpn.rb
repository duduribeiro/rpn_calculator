module Engines
  class RPN
    def initialize
      @stack = []
    end

    def process_input(input)
      if input.value?
        @stack << input.value
        input.value
      else
        raise Errors::InvalidCalculation, 'Not enough values to calculate' if @stack.size < 2
      end
    end
  end
end
