class ShowCommandHandler
    Faraday.default_adapter = :net_http

    def initialize(arguments_string)
        @arguments_string = arguments_string
    end

    def handle_command
        @gem_info = get_from_url("https://rubygems.org/api/v1/gems/#{@arguments_string}.json")
    end

    def print_result
        GemsPrinter.print_gem(@gem_info)
    end

    def get_from_url(url)
        response = Faraday.get(url)
        print url
        result = JSON.parse(response.body)
    end
end