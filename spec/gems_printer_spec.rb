require './gems_printer'

describe GemsPrinter do

    describe "print a gem" do

        it "prints rails gem" do
            gem = {"name" => "rails", "info" => "rails info here"}
            expect(GemsPrinter.print_gem(gem))
        end

    end

end