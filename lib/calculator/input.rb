class Input
  def initialize(input)
    @input = input
  end

  def value
    @input.to_i
  end

  def value?
    /\A\d+\z/.match(@input)
  end
end
