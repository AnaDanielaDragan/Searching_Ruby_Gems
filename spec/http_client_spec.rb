require './lib/http_client'

RSpec.describe HTTPClient do
  subject(:http_client) { HTTPClient }

  let(:search_string) { '' }

  describe '.get_gems_list' do
    subject(:get_gems_list) { http_client.get_gems_list(search_string) }

    context 'when giving no parameters' do
      let(:search_string) { '' }

      it 'returns an empty object' do
        expect(get_gems_list).to be_empty
      end
    end

    context 'when requesting a gem' do
      let(:search_string) { 'rspec' }

      it 'returns a JSON object containing one or multiple objects' do
        expect(get_gems_list.length).to be >= 1
      end
    end
  end

  describe '.get_gem_info' do
    subject(:get_gem_info) { http_client.get_gem_info(search_string) }

    context 'when giving no parameters' do
      let(:search_string) { '' }

      it 'returns an empty object' do
        expect(get_gem_info).to be_empty
      end
    end

    context 'searches for rails gem' do
      let(:search_string) { 'rails' }

      it 'returns a JSON object containing name => rails' do
        expect(get_gem_info).to include('name' => 'rails')
      end
    end
  end
end
