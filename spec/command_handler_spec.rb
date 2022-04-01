require './lib/command_handler'
require 'json'

RSpec.describe CommandHandler do
  subject(:command_handler) { CommandHandler }

  let(:args) { [] }

  describe '.execute' do
    subject(:execute) { command_handler.execute(args) }

    context 'returns a array result for no command given' do
      let(:label) { 'message' }

      it "contains a string 'message'" do
        expect(execute[0]).to eql(label)
      end

      it 'contains a text' do
        expect(execute[1]).to be_a(String)
      end
    end

    context 'returns an array result for show command' do
      let(:label) { 'gem_info' }
      let(:args) { %w[show rspec] }

      it "contains a string 'gem_info'" do
        expect(execute[0]).to eql(label)
      end

      it 'contains the pair name : rspec' do
        expect(execute[1]).to include({ 'name' => 'rspec' })
      end
    end

    context 'returns an array result for search command' do
      let(:label) { 'gems_list' }
      let(:args) { %w[search rspec] }

      it "contains a string 'gems_list'" do
        expect(execute[0]).to eql(label)
      end

      it 'contains an array' do
        expect(execute[1]).to be_a(Array)
      end
    end
  end
end
