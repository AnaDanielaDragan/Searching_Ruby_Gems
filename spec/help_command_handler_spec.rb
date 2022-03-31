require './lib/help_command_handler'

RSpec.describe HelpCommandHandler do
  subject(:help_command_handler) { HelpCommandHandler.new }

  describe '#print_help_message' do
    context 'when initialising' do
      let(:help_message) { 'Try one of these commands: <show>, <search>' }

      it 'shows a list of available commands' do
        expect { help_command_handler.print_help_message }.to output(help_message).to_stdout
      end
    end
  end
end
