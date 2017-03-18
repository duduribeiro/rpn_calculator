module Interfaces
  class CLI < BaseInterface
    def start
      puts 'Starting calculator.'
      while stdin = $stdin.gets&.chomp
        input = Input.new(stdin)
        puts input.to_s
        result = engine.process_input(input)
        puts result if result
      end
    end
  end
end
