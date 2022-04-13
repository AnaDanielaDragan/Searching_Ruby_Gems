require './lib/ruby_gems_client'
require './lib/ruby_gems_client_with_cache'

class ShowCommandHandler
  def self.execute(arguments_string)
    GemInfo.new(RubyGemsClientWithCache.info(arguments_string))
  end
end
