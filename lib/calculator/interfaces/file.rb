module Interfaces
  class File < BaseInterface
    def start(params)
      ::File.readlines(params.first).each do |line|
        input  = Input.new(line.chomp)
        result = process_input(input)
        puts "> #{result}"
      end
    end
  end
end
