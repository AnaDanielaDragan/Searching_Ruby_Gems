require_relative 'handle_user_commands'

module CommandParser

    include HandleUserCommands

    def execute_command(arguments)
        arguments.each do |arg|
            case arg
            when "search" then handle_search
            when "show" then handle_show
            end
        end
    end

end