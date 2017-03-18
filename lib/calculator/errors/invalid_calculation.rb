module Errors
  class InvalidCalculation < StandardError
    def initialize(message)
      super(message)
    end
  end
end
