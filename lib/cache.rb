require 'sqlite3'
require 'time'

class Cache
  DEFAULT_CACHE_EXPIRATION_TIME = 48 * 60 * 60

  def self.create
    @instance ||= new
  end

  def initialize
    @db = SQLite3::Database.open 'CACHE.db'
    @db.execute 'CREATE TABLE IF NOT EXISTS cache(key VARCHAR(16) PRIMARY KEY, expire_date TEXT, value TEXT)'
  end

  def read(key)
    @db = SQLite3::Database.open 'CACHE.db'
    results = @db.query 'SELECT expire_date, value FROM cache WHERE key=?', key
    first_result = results.next

    if first_result
      parsed_expire_date = Time.parse(first_result[0])
      parsed_now = Time.parse(Time.now.iso8601)

      puts first_result[1]
      #result = first_result[1].gsub(//, '')

      first_result[1] if parsed_expire_date > parsed_now
    end
  ensure
    results.close
    @db.close
  end

  def write(key, value)
    # value is a JSON object
    return if value.nil?

    expire_date = Time.now + DEFAULT_CACHE_EXPIRATION_TIME
    @db = SQLite3::Database.open 'CACHE.db'
    @db.execute 'INSERT INTO cache (key, expire_date, value) VALUES (?, ?, ?)',
                key, expire_date.iso8601, JSON.dump(value)
  ensure
    @db.close
  end
end
