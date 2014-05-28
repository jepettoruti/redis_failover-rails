# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'redis_failover-rails/version'

Gem::Specification.new do |s|
  s.name        = 'redis_failover-rails'
  s.version     = RedisFailoverRails::VERSION
  s.authors     = ['Jose Pettoruti - Surfdome.com']
  s.email       = ['jose.pettoruti@surfdome.com']
  s.homepage    = 'https://github.com/surfdome/redis_failover-rails'
  s.summary     = %q{An ActiveSupport::Cache store using redis_failover}
  s.description = %q{An ActiveSupport::Cache store using redis_failover (a zookeeper based implementation of HA redis) for Rails apps.}
  s.license     = 'MIT'

  # s.rubyforge_project = 'redis-rails'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'redis_failover'


  s.add_development_dependency 'rake',     '~> 10'
  s.add_development_dependency 'bundler',  '~> 1.3'
  s.add_development_dependency 'mocha'  #,    '~> 0.14.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'awesome_print'

  s.add_dependency 'activesupport', '~> 4'
  s.add_dependency 'actionpack',  '~> 4'

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "sqlite3"

end
