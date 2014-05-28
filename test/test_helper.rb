require 'rails'
require 'action_controller/metal/live'

require 'test/unit'
# require 'mocha/setup'
require 'mocha/test_unit'
require 'shoulda-context'
require 'ap'

require 'redis_factory'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require 'active_support/cache/redis_cache_store'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

def dump_redis
  result = {}
  Resque.redis.keys("*").each do |key|
    type = Resque.redis.type(key)
    result["#{key} (#{type})"] = case type
      when 'string' then Resque.redis.get(key)
      when 'list' then Resque.redis.lrange(key, 0, -1)
      when 'zset' then Hash[*Resque.redis.zrange(key, 0, -1, :with_scores => true)]
      when 'set' then Resque.redis.smembers(key)
      when 'hash' then Resque.redis.hgetall(key)
      else type
    end
  end
  return result
end

def truncate_test_redis
  if Rails.env.test? # extra paranoid with an operation like this
    redis_dbs = RedisFactory.configuration.keys.each do |k|
      RedisFactory.connect(k).flushdb()
    end
  end
end

class ActiveSupport::TestCase
  setup do
    # Make sure the tests start with a clean redis
    truncate_test_redis
  end

end

