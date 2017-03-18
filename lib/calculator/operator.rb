require 'calculator/operators/sum'
require 'calculator/operators/product'

class Operator
  OPERATORS = {
    '+' => Operators::Sum,
    '*' => Operators::Product
  }.freeze

  def self.by_key(key)
    OPERATORS[key]
  end

  def self.exists?(key)
    OPERATORS.keys.include?(key)
  end
end
