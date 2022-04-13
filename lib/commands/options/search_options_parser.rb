class SearchOptionsParser
  def self.parse(arguments_string)
    options = { most_downloads_first: false, license: nil }

    options[:most_downloads_first] = true if arguments_string.include?('--most-downloads-first')

    if arguments_string.include?('--license')
      license_argument = arguments_string.partition('--license').last
      license = license_argument.empty? ? '' : license_argument.delete(' ')
      options[:license] = license
    end

    options
  end
end
