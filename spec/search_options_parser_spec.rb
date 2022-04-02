require './lib/search_options_parser'

RSpec.describe SearchOptionsParser do
  subject(:search_options_parser) { SearchOptionsParser }

  describe '.parse' do
    subject(:parse) { search_options_parser.parse(args) }

    let(:args) { '' }

    context 'when requesting --most-downloads-first' do
      let(:args) { '--most-downloads-first' }

      it 'puts true to options[:most_downloads_first]' do
        expect(parse[:most_downloads_first]).to eql(true)
      end
    end

    context 'when requesting --license' do
      let(:args) { '--license MIT' }

      it 'puts MIT to options[:license]' do
        expect(parse[:license]).to eql('MIT')
      end
    end

    context 'when no options are given' do

      it 'puts false to options[:most_downloads_first]' do
        expect(parse[:most_downloads_first]).to eql(false)
      end

      it 'puts nil to options[:license]' do
        expect(parse[:license]).to eql(nil)
      end
    end
  end
end
