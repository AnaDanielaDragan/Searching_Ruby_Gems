class SearchCommandHandler
    Faraday.default_adapter = :net_http
    
    def initialize(arguments_string)
        @arguments_string = arguments_string
    end

    def handle_command
        @gems_list = search_gems(@arguments_string)
    end

    def print_result
        GemsPrinter.print_filtered_gems_by(@gems_list, "name", @arguments_string)
    end
    
    private
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

end

#use commands design pattern to handle executions of commands