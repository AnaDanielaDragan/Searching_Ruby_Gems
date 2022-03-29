require 'faraday'
require 'json'
require './lib/help_command_handler'

class CommandHandler
    Faraday.default_adapter = :net_http

    def initialize(arguments_string)
        @arguments_string = arguments_string
    end

    def handle_command
        HelpCommandHandler.new.print_help_message
    end

    def get_from_url(url)
        response = Faraday.get(url)
        result = JSON.parse(response.body)
    end
end