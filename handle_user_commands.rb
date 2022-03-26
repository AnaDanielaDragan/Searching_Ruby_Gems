require_relative 'get_gems'

module HandleUserCommands

    #include GetGemsUsingGems
    include GetGemsUsingFaraday
    
    def handle_search(argv)
        
        search_string = ArgumentsParser.get_arguments_string(argv, "search")
        
        gems_list = search_gems(search_string)

        #print_gems_by(gems_list, "name")
        print_filtered_gems_by(gems_list, "name", search_string)

    end

    def handle_show(argv)

        #parse arguments
        show_string = ArgumentsParser.get_arguments_string(argv, "show")
        
        #execute command with arguments
        gem_info = show_gem(show_string)

        #print result
        print_gem(gem_info)

    end

    private
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