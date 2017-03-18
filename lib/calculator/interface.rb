require 'calculator/interfaces/cli'

module Interface
  INTERFACES = {
    cli: Interfaces::CLI
  }

  def self.load_interface(interface_name)
    INTERFACES[interface_name.to_sym]
  end
end
