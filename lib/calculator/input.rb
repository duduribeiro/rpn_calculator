class Input
  def initialize(input)
    @input = input
  end

  def operator_key
    @input
  end

  def operator?
    Operator.exists?(@input)
  end

  def value
    @input.to_i
  end

  def value?
    /\A[-+]?[0-9]+\z/.match(@input)
  end

  def to_s
    @input
  end
end
