class GemsPrinter
  def self.print_gem(gem_info)
    gem_info.each do |label, info|
      puts "#{label}: #{info}"
    end
  end

  def self.print_filtered_gems_by(gems_list, label_name, search_string)
    gems_found_by_name_search = []
    gems_found_by_info_search = []

    gems_list.each do |gem|
      gem.each do |label, info|
        if label == 'name'
          info.include?(search_string) ? gems_found_by_name_search.push(gem) : gems_found_by_info_search.push(gem)
        end
      end
    end

    puts 'Gems found by name:'
    print_gems_by(gems_found_by_name_search, label_name)

    puts 'Gems found by info:'
    print_gems_by(gems_found_by_info_search, label_name)

    puts "Number of gems found: #{gems_list.length}"
  end

  def self.print_gems_by(gems_list, label_name)
    gems_list.each do |gem|
      gem.each do |label, info|
        puts info if label == label_name
      end
    end
  end
end

# continue with refactoring the printing methods
