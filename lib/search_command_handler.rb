require './lib/command_handler'
require './lib/gems_printer'

class SearchCommandHandler < CommandHandler
  def handle_command
    @gems_list = search_gems(@arguments_string)
  end

  def print_result
    GemsPrinter.print_filtered_gems_by(@gems_list, 'name', @arguments_string)
  end

  private

  def search_gems(search_string)
    page = 1

    result = get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}")

    until get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}").empty?
      result.concat(get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}"))
      page += 1

      # change search restictions here
      next unless result.length > 10

      puts "Number of pages read: #{page}"
      puts 'Too many results to handle!'
      return result
    end

    puts "Number of pages found: #{page}"
    result
  end
end
