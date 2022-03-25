require_relative 'handle_user_commands'

class Cli 

    include HandleUserCommands

    def run
        ARGV.each do |arg|
            case arg
            when "search" then handle_search
            when "show" then handle_show
            end
        end
    end

end

cli = Cli.new 
cli.run

puts "Successful exit!"
exit(0)