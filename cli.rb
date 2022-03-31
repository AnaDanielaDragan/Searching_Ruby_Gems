require_relative 'lib/arguments_parser'

class CLI
  def self.run
    command = ArgumentsParser.new(ARGV)
    command.parse
    command.execute
  end
end

CLI.run
