require './lib/command_handler'
require './lib/gems_printer'
require './lib/ruby_gems_client'

class SearchCommandHandler < CommandHandler
  def handle_command
    @gems_list = RubyGemsClient.search(@arguments_string)
  end

  def print_result
    GemsPrinter.print_gems_by(@gems_list, 'name')
  end
end
