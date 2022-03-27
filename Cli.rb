require_relative 'lib/arguments_parser'

class Cli
    def self.run
         command = ArgumentsParser.new(ARGV)
         command.parse
         command.execute
    end
end

Cli.run
