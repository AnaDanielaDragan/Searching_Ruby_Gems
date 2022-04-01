require 'faraday'
require 'json'

class HTTPClient
  Faraday.default_adapter = :net_http

  class << self
    def get_gems_list(search_string)
      page = 1

      result = get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}")

      until get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}").empty?
        result.concat(get_from_url("https://rubygems.org/api/v1/search.json?query=#{search_string}&page=#{page}"))
        page += 1

        # change search restictions here
        break if result.length > 10
      end
      result
    end

    def get_gem_info(search_string)
      get_from_url("https://rubygems.org/api/v1/gems/#{search_string}.json")
    end

    def get_from_url(url)
      response = Faraday.get(url)
      JSON.parse(response.body)
    end
  end
end
