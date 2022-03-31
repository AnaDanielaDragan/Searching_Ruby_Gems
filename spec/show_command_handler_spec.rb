require './lib/show_command_handler'

RSpec.describe ShowCommandHandler do
  subject(:show_command_handler) { ShowCommandHandler.new(args) }

  let(:args) { [] }

  describe '#handle_command' do
    subject(:handle_command) { show_command_handler.handle_command }

    context 'when show details about a gem' do
      let(:args) { 'rails' }

      it 'assigns a value to #gem_info instance variable' do
        handle_command

        expect(show_command_handler.instance_variable_get('@gem_info')).to include('name' => 'rails')
      end

      it 'calls the get_from_url method' do
        allow(show_command_handler).to receive(:get_from_url)

        handle_command

        expect(show_command_handler).to have_received(:get_from_url)
      end
    end
  end
end
