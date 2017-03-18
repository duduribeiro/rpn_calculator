module Interfaces
  module CustomOperations
    module CLI
      class Quit
        def self.execute
          puts '👋  bye bye '
          exit
        end
      end
    end
  end
end
