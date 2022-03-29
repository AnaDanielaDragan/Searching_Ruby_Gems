require './lib/help_command_handler'

class CommandHandler
    Faraday.default_adapter = :net_http

    def initialize(arguments_string)
        @arguments_string = arguments_string
    end

    def handle_command
        HelpCommandHandler.new
    end

    def get_from_url(url)
        response = Faraday.get(url)
        print url
        result = JSON.parse(response.body)
    end
end