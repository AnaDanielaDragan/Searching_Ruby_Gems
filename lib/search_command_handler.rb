require './lib/ruby_gems_client'
require './lib/search_options_parser'
require './lib/gem_info'
require './lib/options_handler'
require './lib/ruby_gems_client_with_cache'
require 'pry'

class SearchCommandHandler
  def self.execute(arguments_string)
    gems_list = RubyGemsClientWithCache.search(arguments_string.split.first)

    gems_list = gems_list.map { |gem| GemInfo.new(gem) }

    options = SearchOptionsParser.parse(arguments_string)

    OptionsHandler.apply(options, gems_list)
  end
end
