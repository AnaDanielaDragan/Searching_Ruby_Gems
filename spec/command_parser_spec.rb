require './command_parser'

describe CommandParser do
    include CommandParser

    describe "Run program" do
        it "show rspec details" do  
            rubygems_response = { name: 'rspec' }
            expect(self).to receive(:print_gem).with(rubygems_response)
            expect(self).to receive(:show_gem).with('rspec').and_return(rubygems_response)
            execute_command(["show", "rspec"])
        end

        it "search ruby gem" do
            gems_list_response = []
            expect(self).to receive(:print_filtered_gems_by).with(gems_list_response, "name", "rspec")
            expect(self).to receive(:search_gems).with('rspec').and_return(gems_list_response)
            execute_command(["search", "rspec"])
        end

    end
end
