class ResultPrinter
  class << self
    def print(result)
      case result[0]
      when 'message' then print_message(result[1])
      when 'gems_list' then print_gems_by(result[1])
      when 'gem_info' then print_gem(result[1])
      else print_message('Nothing to print.')
      end
    end

    def print_gem(gem_info)
      puts gem_info
    end

    def print_gems_by(gems_list)
      gems_list.each do |gem|
        puts gem.name
      end

      puts "Number of gems found: #{gems_list.length}"
    end

    def print_message(message_string)
      puts message_string
    end
  end
end
