require 'optparse'

module Calculator
  class Runner
    def initialize(args)
      @args = args
    end

    def execute
      options = parse_options(@args)

      engine    = Engine.load_engine(options[:engine])
      interface = Interface.load_interface(options[:interface])
    end

    private

    def parse_options(args)
      options = { interface: :cli } # Default parameters
      opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: opt_parser COMMAND [OPTIONS]'

        opt.on('-e', '--engine ENGINE', 'which engine do you want to use (rpn)', [:rpn]) do |engine|
          options[:engine] = engine
        end

        opt.on('-i', '--interface INTERFACE', 'Interface input to use (cli (default), file)', [:cli, :file]) do |input|
          options[:interface] = input
        end

        opt.on('-h', '--help', 'help') do
          puts opt_parser
          exit
        end
      end
      opt_parser.parse!(args)

      options
    end
  end
end
