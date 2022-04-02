require './lib/ruby_gems_client'
require './lib/search_options_parser'
require './lib/gem_info'
require './lib/options_handler'

class SearchCommandHandler
  def self.execute(arguments_string)
    gems_list = RubyGemsClient.search(arguments_string.split.first)
                              .map { |gem| GemInfo.new(gem) }

    options = SearchOptionsParser.parse(arguments_string)

    #gems_list = options[0].apply(gems_list)

    OptionsHandler.apply(options, gems_list)
  end
end
