require './lib/search_command_handler'
require './lib/show_command_handler'
require './lib/command_handler_context'

class ArgumentsParser
  def initialize(arguments)
    @arguments = arguments
    @context_handler = CommandHandlerContext.new
  end

  def parse
    @command_string = @arguments[0]
    @arguments_string = @arguments[1..].join(' ')
  end

  def execute
    case @command_string
    when 'show' then @context_handler.set_command_handler(ShowCommandHandler.new(@arguments_string))
    when 'search' then @context_handler.set_command_handler(SearchCommandHandler.new(@arguments_string))
    else puts 'No command given.'
    end

    @context_handler.execute
  end
end
