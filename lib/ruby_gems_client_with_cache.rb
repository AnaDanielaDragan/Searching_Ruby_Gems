require './lib/ruby_gems_client'
require './lib/cache'
require 'digest'

class RubyGemsClientWithCache
  class << self
    def search(search_string)
      key = cache_key('search', search_string)

      result = cache.read(key)

      if result
        result = JSON.parse(result)
      else
        result = RubyGemsClient.search(search_string) # JSON object
        p 'Not using cache'
        cache.write(key, result)
      end

      result
    end

    def info(gem_name)
      key = cache_key('info', gem_name)

      result = cache.read(key)

      if result
        result = JSON.parse(result)
      else
        result = RubyGemsClient.info(gem_name) # JSON object
        p 'Not using cache'
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
end
