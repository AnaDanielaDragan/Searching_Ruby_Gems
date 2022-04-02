require './lib/ruby_gems_client'
require 'optparse'

class SearchCommandHandler
  def self.execute(arguments_string)
    RubyGemsClient.search(arguments_string)
  end
end
