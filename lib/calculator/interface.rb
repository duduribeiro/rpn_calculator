require 'calculator/interfaces/base_interface'
require 'calculator/interfaces/cli'
require 'calculator/interfaces/file'

module Interface
  INTERFACES = {
    cli: Interfaces::CLI,
    file: Interfaces::File
  }.freeze

  def self.load_interface(interface_name)
    INTERFACES[interface_name.to_sym]
  end
end
