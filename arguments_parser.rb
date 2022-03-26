class ArgumentsParser

    def self.get_arguments_string(argv, command_argument)
        argv.delete(command_argument)
        argv.join(" ")
    end

end