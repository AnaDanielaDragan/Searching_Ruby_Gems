require 'faraday'
require 'json'
require './lib/gems_printer'
require './lib/search_command_handler'
require './lib/show_command_handler'

class ArgumentsParser
    Faraday.default_adapter = :net_http

    #continue refactoring here

    def initialize(arguments)
        @arguments = arguments
    end

    def parse
        @command_string = @arguments[0]
        @arguments_string = @arguments[1..].join(" ")
    end

    def execute
        case @command_string
        when "show" then handle_show(@arguments_string)
        when "search" then handle_search(@arguments_string)
        else puts "No command given."
        end
    end

    private

    def handle_search(argv)
        handler = SearchCommandHandler.new(argv)
        handler.handle_command
        handler.print_result
    end

    def handle_show(argv)
        handler = ShowCommandHandler.new(argv)
        handler.handle_command
        handler.print_result
    end
end
