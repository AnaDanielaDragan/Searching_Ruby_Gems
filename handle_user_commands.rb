require_relative 'get_gems'

module HandleUserCommands

    #include GetGemsUsingGems
    include GetGemsUsingFaraday
    
    def handle_search
        puts "You said SEARCH"
        search_string = get_arguments_string("search")
        puts "Here are your results for searching #{search_string}: "
        
        gems_list = search_gems(search_string)

        #print_gems_by(gems_list, "name")
        print_filtered_gems_by(gems_list, "name", search_string)

    end

    def handle_show
        puts "You said SHOW"
        show_string = get_arguments_string("show")
        puts "Here are your details about #{show_string}:"
        
        gem_info = show_gem(show_string)
        
        print_gem(gem_info)

    end

    private
    def get_arguments_string(argument)
        ARGV.delete(argument)
        ARGV.join(" ")
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
        gem_info.each do |label, info|
            puts "#{label}: #{info}"
        end
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