require './lib/commands/search_command_handler'
require './lib/commands/show_command_handler'

class CommandHandler
  def self.execute(arguments)
    command_string = arguments[0]
    arguments_string = arguments[1]

    case command_string
    when 'show'
      ['gem_info', ShowCommandHandler.execute(arguments_string)]
    when 'search'
      ['gems_list', SearchCommandHandler.execute(arguments_string)]
    else
      ['message', 'Try one of these commands: <show>, <search>']
    end
  end
end
