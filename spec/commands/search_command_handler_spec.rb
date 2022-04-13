require './lib/commands/search_command_handler'

RSpec.describe SearchCommandHandler, :only do
  subject(:search_command_handler) { SearchCommandHandler }

  describe '.execute' do
    subject(:execute) { search_command_handler.execute(args) }

    context 'when parsing arguments' do
      let(:args) { 'rspec' }

      it 'returns an array containing at least one result' do
        expect(execute.length).to be > 1
      end


      it 'returns an array containing rspec as the first result' do
        first = execute.first
        expect(first.name).to eql('rspec')
        expect(first.info).to eql('BDD for Ruby')
      end
    end

    context 'when passing arguments and most downloaded options' do
      let(:args) { 'rspec --most-downloads-first' }

      it 'returns most downloaded first' do
        first = execute.first
        last = execute.last
        expect(first.downloads).to be > last.downloads
      end
    end

    context 'when passing arguments and license options' do
      let(:args) { 'rspec --license MIT' }

      it 'returns gems with MIT license' do
        result = execute.filter { |gem_info| !gem_info.licenses.include?('MIT') }
        expect(result).to be_empty
      end
    end
  end
end
