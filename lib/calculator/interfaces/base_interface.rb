module Interfaces
  class BaseInterface
    def initialize(options = {})
      @engine = options[:engine]
    end

    private

    attr_reader :engine
  end
end
