require './lib/http_client'

class RubyGemsClient
  def self.search(search_string)
    HTTPClient.get_gems_list(search_string)
  end

  def self.info(gem_name)
    HTTPClient.get_gem_info(gem_name)
  end
end
