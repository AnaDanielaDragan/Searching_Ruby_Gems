require './lib/arguments_parser'

RSpec.describe ArgumentsParser do
  subject(:arguments_parser) { ArgumentsParser.new(args) }

  let(:args) { [] }

  describe '#parse' do
    subject(:parse) { arguments_parser.parse }

    context 'when showing a gem' do
      let(:args) { %w[show rspec] }

      xit 'shows a gem details' do
        allow(arguments_parser).to receive(:handle_show).with('rspec')

        arguments_parser.parse
        arguments_parser.execute

        expect(arguments_parser).to have_received(:handle_show).with('rspec')
      end
    end

    context 'when searching for a gem' do
      let(:args) { %w[search rspec] }

      xit 'search ruby gem' do
        allow(arguments_parser).to receive(:handle_search).with('rspec')

        arguments_parser.parse
        arguments_parser.execute

        expect(arguments_parser).to have_received(:handle_search).with('rspec')
      end
    end
  end
end
