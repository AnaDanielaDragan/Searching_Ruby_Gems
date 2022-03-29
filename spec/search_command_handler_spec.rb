require './lib/search_command_handler'

RSpec.describe SearchCommandHandler do
    subject(:search_command_handler) { SearchCommandHandler.new(args) }

    let(:args) { [] }

    describe '#handle_command' do
        subject(:handle_command) { search_command_handler.handle_command }

        context 'when searching for a gem' do
            let(:args) { 'rails' }

            it 'calls the search_gems method with rails paramater' do
                allow(search_command_handler).to receive(:search_gems).with('rails')

                handle_command

                expect(search_command_handler).to have_received(:search_gems).with('rails')
            end

            it 'returns a list containing rails' do
                result = search_command_handler.send(:search_gems, args)
                expect(result).to be_a Array
            end
        end
    end
end