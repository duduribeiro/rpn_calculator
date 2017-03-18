require 'calculator/operators/sum'

class Operator
  OPERATORS = {
    '+' => Operators::Sum
  }.freeze

  def self.by_key(key)
    OPERATORS[key]
  end

  def self.exists?(key)
    OPERATORS.keys.include?(key)
  end
end
