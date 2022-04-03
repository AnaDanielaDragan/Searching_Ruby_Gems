require './lib/ruby_gems_client'

RSpec.describe RubyGemsClient do
  subject(:client) { RubyGemsClient }

  describe '.search' do
    subject(:search) { client.search(search_string) }

    context 'when searching with no parameters' do
      let(:search_string) { '' }

      it 'returns an empty object' do
        expect(search).to be_empty
      end
    end

    context 'when searching for rails gem' do
      let(:search_string) { 'rails' }

      it 'returns a JSON object containing one or multiple objects' do
        expect(search.length).to be >= 1
      end
    end
  end

  describe '.info' do
    subject(:info) { client.info(gem_name) }

    context 'when requesting gem info with no parameters' do
      let(:gem_name) { '' }

      it 'returns an empty object' do
        expect(info).to be_empty
      end
    end

    context 'when requesting infor about rails' do
      let(:gem_name) { 'rails' }

      it 'returns a JSON object containing name => rails' do
        expect(info).to include('name' => 'rails')
      end
    end
  end
end
