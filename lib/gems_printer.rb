class GemsPrinter
  def self.print_gem(gem_info)
    gem_info.each do |label, info|
      puts "#{label}: #{info}"
    end
  end

  def self.print_gems_by(gems_list, label_name)
    gems_list.each do |gem|
      gem.each do |label, info|
        puts info if label == label_name
      end
    end

    puts "Number of gems found: #{gems_list.length}"
  end
end

# continue with refactoring the printing methods
