require './lib/commands/options/most_downloads_option_handler'
require './lib/commands/options/license_option_handler'

class OptionsHandler
  def self.apply(options, gems_list)
    gems_list = MostDownloadsOptionHandler.apply(gems_list) if options[:most_downloads_first]

    gems_list = LicenseOptionHandler.apply(gems_list, options[:license]) if options[:license]

    gems_list
  end
end
