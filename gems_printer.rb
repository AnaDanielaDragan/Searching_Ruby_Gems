class GemsPrinter

    def self.print_gem(gem_info)
        gem_info.each do |label, info|
            puts "#{label}: #{info}"
        end
    end
    
end