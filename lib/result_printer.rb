class ResultPrinter
  def self.print(result)
    case result.keys
    when 'message' then print_message(result)
    when 'gems_list' then print_gems_by(result.values, 'name')
    when 'gem_info' then print_gem(result.values)
    else print_message('Nothing to print.')
  end

  def print_gem(gem_info)
    gem_info.each do |label, info|
      puts "#{label}: #{info}"
    end
  end

  def print_gems_by(gems_list, label_name)
    gems_list.each do |gem|
      gem.each do |label, info|
        puts info if label == label_name
      end
    end

    puts "Number of gems found: #{gems_list.length}"
  end

  def print_message(message_string)
    puts message_string
  end
end
