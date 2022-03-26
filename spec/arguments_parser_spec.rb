require './lib/arguments_parser'

describe ArgumentsParser do

    it "get show command with arguments" do
        argv = ["show", "rails"]
        expect(ArgumentsParser.get_arguments_string(argv, "show")).to eql ("rails")
    end

end