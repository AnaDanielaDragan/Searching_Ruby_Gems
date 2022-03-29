require './lib/gems_printer'

describe GemsPrinter do
    subject(:print_class) {GemsPrinter}

    let(:gem_info) { ['name' => 'rails', 'info' => 'rails info here'] }

    describe '.print_gem' do
        let(:result) { {"name"=>"rails", "info"=>"rails info here"}}

        context 'prints rails gem info' do
            it 'contains given info' do
                expect(print_class.print_gem(gem_info)).to include(result)
            end
        end
    end

    describe '.print_filtered_gems_by' do
        subject(:print_gems_by) { print_class.print_gems_by(gems, "name")}

        let(:gems) { [] }

        context 'prints a gem list' do
            it 'calls print_gems_by method' do
                expect(GemsPrinter).to respond_to(:print_gems_by).with(2).argument

            end
        end
    end

end