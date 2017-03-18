require 'calculator/engines/rpn'

module Engine
  ENGINES = {
    rpn: Engines::RPN
  }

  def self.load_engine(engine_name)
    ENGINES[engine_name.to_sym]
  end
end
