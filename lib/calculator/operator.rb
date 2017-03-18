require 'calculator/operators/sum'
require 'calculator/operators/subtraction'
require 'calculator/operators/product'
require 'calculator/operators/division'

class Operator
  OPERATORS = {
    '+' => Operators::Sum,
    '-' => Operators::Subtraction,
    '*' => Operators::Product,
    '/' => Operators::Division
  }.freeze

  def self.by_key(key)
    OPERATORS[key]
  end

  def self.exists?(key)
    OPERATORS.keys.include?(key)
  end
end
