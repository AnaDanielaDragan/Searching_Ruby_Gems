class CommandHandlerContext
  def set_command_handler(command_handler)
    @command_handler = command_handler
  end

  def execute
    @command_handler.handle_command
    @command_handler.print_result
  end
end
