require './lib/command_handler'
require './lib/gems_printer'
require './lib/ruby_gems_client'

class ShowCommandHandler < CommandHandler
  def handle_command
    @gem_info = RubyGemsClient.info(@arguments_string)
  end

  def print_result
    GemsPrinter.print_gem(@gem_info)
  end
end
