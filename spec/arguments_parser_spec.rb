require './lib/arguments_parser'

RSpec.describe ArgumentsParser do
    subject(:arguments_parser) { ArgumentsParser.new(args) }

    let(:args) { [] }

    describe "#parse" do
        subject(:parse) { arguments_parser.parse }
        
        context 'when showing a gem' do
            let(:args) { ['show', 'rspec'] }

            it "shows a gem details" do  
                allow(arguments_parser).to receive(:print_gem).with hash_including('name' => 'rspec')

                arguments_parser.parse

                expect(arguments_parser).to have_received(:print_gem).with hash_including('name' => 'rspec')
            end
        end

        context 'when searching for a gem' do
            let(:args) { ['search', 'rspec'] }

            it "search ruby gem" do
                gems_list_response = []

                allow(arguments_parser).to receive(:print_filtered_gems_by)
                allow(arguments_parser).to receive(:search_gems).with('rspec')
    
                arguments_parser.parse

                expect(arguments_parser).to have_received(:print_filtered_gems_by)
                expect(arguments_parser).to have_received(:search_gems).with('rspec')
                
                
            end
        end
    end
end