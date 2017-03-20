require 'calculator/interfaces/custom_operations/cli/quit'

module Interfaces
  class CLI < BaseInterface
    def custom_operations
      {
        'q' => Interfaces::CustomOperations::CLI::Quit
      }.freeze
    end

    def start(_param)
      puts 'Starting calculator.'
      while stdin = $stdin.gets&.chomp
          inputs = stdin.split(' ')
          inputs.each do |input|
            begin
              # require 'pry' ; binding.pry
              input = Input.new(input)
              result = process_input(input)
              puts "> #{result}"
            rescue Errors::InvalidCalculation => e
              puts "💥 invalid calculation. #{e.message}"
            rescue Errors::InvalidOperator
              puts "> This isn't a valid operator 😔"
            end
          end
      end
    end
  end
end
