module Operators
  class Division
    def self.execute(x, y)
      raise Errors::InvalidCalculation.new("Division by zero") if y.zero?
      x.to_f / y.to_f
    end
  end
end
