module Engines
  class RPN
    def initialize
      @stack = []
    end

    def process_input(input)
      if input.value?
        @stack << input.value
        nil
      elsif input.operator?
        raise Errors::InvalidCalculation, 'Not enough values to calculate' if @stack.size < 2
        calculate(input.operator_key).tap do |value|
          @stack << value
          return value
        end
      else
        raise Errors::InvalidOperator
      end
    end

    private

    def calculate(operator_key)
      x, y = @stack.pop(2)
      Operator.by_key(operator_key).execute(x, y)
    end
  end
end
