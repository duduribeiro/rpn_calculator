require 'calculator/interfaces/custom_operations/cli/quit'

module Interfaces
  class CLI < BaseInterface
    def custom_operations
      {
        'q' => Interfaces::CustomOperations::CLI::Quit
      }.freeze
    end

    def start
      puts 'Starting calculator.'
      while stdin = $stdin.gets&.chomp
        begin
          input = Input.new(stdin)
          # result = engine.process_input(input)
          result = process_input(input)
          puts "> #{input.to_s}"
          puts "> #{result}" if result
        rescue Errors::InvalidCalculation => e
          puts "💥 invalid calculation. #{e.message}"
        rescue Errors::InvalidOperator
          puts "> This isn't a valid operator 😔"
        end
      end
    end
  end
end
