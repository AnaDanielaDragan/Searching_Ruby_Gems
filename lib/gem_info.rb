require 'pry'

class GemInfo
  attr_reader :name, :info, :downloads, :licenses, :gem_info

  def initialize(gem_info)
    @name = gem_info['name']
    @info = gem_info['info']
    @downloads = gem_info['downloads']
    @licenses = gem_info['licenses']
    @gem_info = gem_info
  end
end
