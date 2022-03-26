require 'rubygems'
require 'gems'

require 'faraday'
require 'faraday/net_http'
require "json"

module GetGemsUsingGems

    def search_gems(search_string)
        Gems.search search_string
    end

    def show_gem(show_string)
        Gems.info show_string
    end

end

module GetGemsUsingFaraday
    Faraday.default_adapter = :net_http

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

    def show_gem(show_string)
        get_from_url("https://rubygems.org/api/v1/gems/#{show_string}.json")
    end

    private
    def get_from_url(url)
        response = Faraday.get(url)
        print url
        result = JSON.parse(response.body)
    end
end