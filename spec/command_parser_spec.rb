require './command_parser'

describe CommandParser do
    include CommandParser

    describe "Run program" do
        it "show rails details" do  
            rubygems_response = { name: 'rspec' }
            expect(self).to receive(:print_gem).with(rubygems_response)
            expect(self).to receive(:show_gem).with('rspec').and_return(rubygems_response)
            execute_command(["show", "rspec"])
        end

    end
end
