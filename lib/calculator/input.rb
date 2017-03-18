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
    /\A\d+\z/.match(@input)
  end

  def to_s
    @input
  end
end
