require_relative 'lib/command_parser'

class Cli
    def self.run
        CommandParser.new(ARGV).parse
    end
end

Cli.run
