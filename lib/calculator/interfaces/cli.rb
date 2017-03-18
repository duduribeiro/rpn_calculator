module Interfaces
  class CLI < BaseInterface
    def start
      puts 'Starting calculator.'
      while input = $stdin.gets
        puts engine.process_input(Input.new(input))
      end
    end
  end
end
