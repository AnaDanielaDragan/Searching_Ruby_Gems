require './lib/printer/result_printer'
require './lib/models/gem_info'

describe ResultPrinter do
  subject(:print_class) { ResultPrinter }

  let(:result) { [] }

  describe '.print' do
    subject(:print) { print_class.print(result) }

    context "result does't correspond to the required format" do
      it 'calls print_message method' do
        expect(print_class).to respond_to(:print_message).with(1).argument
      end
    end

    context 'result is a message' do
      let(:result) { ['message', 'Some message here.'] }

      it 'calls print_message method' do
        expect(print_class).to respond_to(:print_message).with(1).argument
      end
    end

    context 'result is a gems list' do
      let(:result) { ['gems_list', []] }

      it 'calls print_gems_by method' do
        expect(print_class).to respond_to(:print_gems_by).with(1).argument
      end
    end

    context 'result is a gem info' do
      let(:result) { ['gem_info', []] }

      it 'calls print_gem method' do
        expect(print_class).to respond_to(:print_gem).with(1).argument
      end
    end
  end

  describe '.print_gem' do
    subject(:print_gem) { print_class.print_gem(gem_info) }

    let(:gem_info) { GemInfo.new({ 'name' => 'rails', 'info' => 'rails info here' }) }

    context 'prints rails gem info' do
      it 'contains given info' do
        expect(print_class).to respond_to(:print_gem).with(1).argument
      end
    end
  end

  describe '.print_gems_by' do
    subject(:print_gems_by) { print_class.print_gems_by(gems, 'name') }

    let(:gems) { [] }

    context 'prints a gem list' do
      it 'calls print_gems_by method' do
        expect(print_class).to respond_to(:print_gems_by).with(1).argument
      end
    end
  end
end
