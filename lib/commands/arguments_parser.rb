class ArgumentsParser
  def self.parse(arguments)
    return [] if arguments.empty?

    @command_string = arguments[0]
    @arguments_string = arguments[1..].join(' ')

    [@command_string, @arguments_string]
  end
end
