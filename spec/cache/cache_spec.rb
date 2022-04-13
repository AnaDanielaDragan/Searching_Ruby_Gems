require './lib/cache/cache'

RSpec.describe Cache do
  subject(:cache) { Cache.create }

  describe '#read' do
    subject(:read) { cache.read(key) }

    context 'reading an entry' do
    end
  end

  # Question: How to test this class?
  # Ideas:
  #   - Mock the database
  #   - Add test entry at the beginning and remove it at the end
end
