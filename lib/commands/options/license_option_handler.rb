class LicenseOptionHandler
  def self.apply(gems_list, license_name)
    gems_list.filter { |gem| gem.licenses.include?(license_name) }
  end
end
