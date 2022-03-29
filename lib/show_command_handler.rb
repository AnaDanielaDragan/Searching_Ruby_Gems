require './lib/command_handler'

class ShowCommandHandler < CommandHandler
    def handle_command
        @gem_info = get_from_url("https://rubygems.org/api/v1/gems/#{@arguments_string}.json")
    end

    def print_result
        GemsPrinter.print_gem(@gem_info)
    end
end