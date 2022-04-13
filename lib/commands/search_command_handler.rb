require './lib/client/ruby_gems_client'
require './lib/client/ruby_gems_client_with_cache'
require './lib/commands/options/options_handler'
require './lib/commands/options/search_options_parser'
require './lib/models/gem_info'

class SearchCommandHandler
  def self.execute(arguments_string)
    gems_list = RubyGemsClientWithCache.search(arguments_string.split.first)

    gems_list = gems_list.map { |gem| GemInfo.new(gem) }

    options = SearchOptionsParser.parse(arguments_string)

    OptionsHandler.apply(options, gems_list)
  end
end
