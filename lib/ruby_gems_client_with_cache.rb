require './lib/ruby_gems_client'
require './lib/cache'
require 'digest'

class RubyGemsClientWithCache
  def self.search(search_string)
    key = cache_key('search', search_string)

    result = cache.read(key)

    unless result
      result = RubyGemsClient.search(search_string)

      cache.write(key, result)
    end

    result
  end

  def self.info(gem_name)
    key = cache_key('info', gem_name)

    result = cache.read(key)

    unless result
      result = RubyGemsClient.info(gem_name)

      cache.write(key, result)
    end

    result
  end

  private

  def cache
    Cache.create
  end

  def cache_key(*args)
    Digest::MD5.hexdigest(args.join(''))
  end
end
