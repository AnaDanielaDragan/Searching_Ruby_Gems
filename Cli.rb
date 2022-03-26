require_relative 'command_parser'

class Cli

    include CommandParser

    def run
        execute_command(ARGV)
    end

end

cli = Cli.new 
cli.run

puts "Successful exit!"
exit(0)