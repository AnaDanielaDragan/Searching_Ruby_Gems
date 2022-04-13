class MostDownloadsOptionHandler
  def self.apply(gems_list)
    gems_list.sort_by { |gem| -gem.downloads }
  end
end
