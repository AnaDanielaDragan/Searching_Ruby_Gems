require './lib/commands/arguments_parser'

RSpec.describe ArgumentsParser do
  subject(:arguments_parser) { ArgumentsParser }

  let(:args) { [] }

  describe '.parse' do
    subject(:parse) { arguments_parser.parse(args) }

    context 'when parsing arguments' do
      let(:args) { %w[show rspec] }

      it 'returns an array containing the command show and arguments rspec' do
        expect(parse).to eql(args)
      end
    end

    context 'when parsing multiple arguments' do
      let(:args) { %w[show rspec rails] }
      let(:result) { ['show', 'rspec rails'] }

      it 'returns an array containing the command show and arguments rspec rails' do
        expect(parse).to eql(result)
      end
    end

    context 'when no arguments are given' do
      it 'returns an empty array' do
        expect(parse).to eql([])
      end
    end
  end
end
