require './lib/command_handler'

RSpec.describe CommandHandler do
    subject(:command_handler) { CommandHandler.new(args) }

    let(:args) { [] }

    describe '#handle_command' do
        subject(:handle_command) { command_handler.handle_command }

        context 'returns a help message' do
            let(:help) { HelpCommandHandler.new }

            it 'creates a HelpCommandHandler object' do
                allow(command_handler).to receive(:handle_command).and_return(:help)

                handle_command

                expect(command_handler).to have_received(:handle_command)
            end
        end
    end

    describe '#get_from_url' do
        subject(:get_from_url) { command_handler.get_from_url(url)}

        context 'searches for rails gem' do
            let(:url) { "https://rubygems.org/api/v1/gems/rails.json" }

            it 'returns a JSON object containing name => rails' do
                expect(get_from_url).to include('name' => 'rails')
            end
        end
    end
end