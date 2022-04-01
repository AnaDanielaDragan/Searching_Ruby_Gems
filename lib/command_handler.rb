require './lib/ruby_gems_client'

class CommandHandler
  def self.execute(arguments)
    command_string = arguments[0]
    arguments_string = arguments[1]

    case command_string
    when 'show'
      ['gem_info', RubyGemsClient.info(arguments_string)]
    when 'search'
      ['gems_list', RubyGemsClient.search(arguments_string)]
    else
      ['message', 'Try one of these commands: <show>, <search>']
    end
  end
end
