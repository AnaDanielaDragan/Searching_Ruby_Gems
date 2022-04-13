require './lib/arguments_parser'
require './lib/command_handler'
require './lib/result_printer'

class CLI
  def self.run
    arguments = ArgumentsParser.parse(ARGV)
    result = CommandHandler.execute(arguments)
    ResultPrinter.print(result)
  end
end

CLI.run
