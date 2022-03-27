require 'faraday'
require 'json'
require './lib/gems_printer'

class ArgumentsParser
    Faraday.default_adapter = :net_http

    #continue refactoring here

    def initialize(arguments)
        @arguments = arguments
    end

    def parse
        @arguments.each do |arg|
            case arg
            when "search" then handle_search(@arguments)
            when "show" then handle_show(@arguments)
            end
        end
    end

    private

    def handle_search(argv)
        search_string = argv[1]
        gems_list = search_gems(search_string)

        print_filtered_gems_by(gems_list, "name", search_string)
    end

    def handle_show(argv)
        show_string = argv[1]
        gem_info = get_from_url("https://rubygems.org/api/v1/gems/#{show_string}.json")

        print_gem(gem_info)
    end

    def search_gems(search_string)
        page = 1

        result = get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}")

        until get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}").empty?
            result.concat(get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}"))
            page += 1

            #change search restictions here
            if result.length > 500
                puts "Number of pages read: #{page}"
                puts "Too many results to handle!"
                return result
            end

        end

        puts "Number of pages found: #{page}"
        return result

    end

    def get_from_url(url)
        response = Faraday.get(url)
        print url
        result = JSON.parse(response.body)
    end

    def print_gems_by(gems_list, label_name)
        gems_list.each do |gem|
            gem.each do |label, info|
                if label == label_name
                    puts info
                end
            end
        end
    end

    def print_gem(gem_info)
        GemsPrinter.print_gem(gem_info)
    end

    def print_filtered_gems_by(gems_list, label_name, search_string)
        gems_found_by_name_search = []
        gems_found_by_info_search = []

        gems_list.each do |gem|
            gem.each do |label, info|
                if label == "name" 
                    info.include?(search_string) ? gems_found_by_name_search.push(gem) : gems_found_by_info_search.push(gem)
                end
            end
        end

        puts "Gems found by name:"
        print_gems_by(gems_found_by_name_search, label_name)

        puts "Gems found by info:"
        print_gems_by(gems_found_by_info_search, label_name)

        puts "Number of gems found: #{gems_list.length()}"
    end
end
