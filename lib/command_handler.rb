require 'faraday'
require 'json'
require './lib/help_command_handler'

class CommandHandler
  def initialize(arguments_string)
    @arguments_string = arguments_string
  end

  def handle_command
    HelpCommandHandler.new.print_help_message
  end
end
