require './lib/command_parser'

RSpec.describe CommandParser do
    subject(:command_parser) { CommandParser.new(args) }

    let(:args) { [] }

    describe "#execute_command" do
        subject(:execute_command) { command_parser.execute_command }
        
        context 'when showing a gem' do
            let(:args) { ['show', 'rspec'] }

            it "shows a gem details" do  
                allow(command_parser).to receive(:print_gem).with hash_including('name' => 'rspec')

                command_parser.execute_command

                expect(command_parser).to have_received(:print_gem).with hash_including('name' => 'rspec')
            end
        end

        context 'when searching for a gem' do
            let(:args) { ['search', 'rspec'] }

            it "search ruby gem" do
                gems_list_response = []
    
                expect(self).to receive(:print_filtered_gems_by).with(gems_list_response, "name", "rspec")
                expect(self).to receive(:search_gems).with('rspec').and_return(gems_list_response)
                
                execute_command
            end
        end
    end
end
