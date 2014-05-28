# redis_failover-rails

[ ![Codeship Status for surfdome/redis_failover-rails](https://codeship.io/projects/1f022be0-c7b8-0131-24ea-6eafa0062d3a/status?branch=master)](https://codeship.io/projects/22198)

An ActiveSupport::Cache store using redis_failover (a zookeeper based implementation of HA redis) for Rails apps.

This is based on the work done by [@wr0ngway](https://github.com/wr0ngway) (Matt Conway), available on [redis_failover_example](https://github.com/wr0ngway/redis_failover_example).

Also, this gem utilizes redis_failover, a gem that creates a Redis HA implementation, using zookeeper for mantaining the available nodes.
This can be found on [redis_failover](https://github.com/ryanlecompte/redis_failover).

## Requirements
In order to work, this requires a working [redis_failover](https://github.com/ryanlecompte/redis_failover) implementation. Please follow the instructions on the gem and ask your favourite Sysadmin/DevOps to implement in your environment.

## Considerations
In case you don't have a redis_failover implementation working, and for helping in the development process, this also works with a single node redis server.
Just don't specify zkservers in the config file.

## Installation

Just add the dependency to your Gemfile...

    # Gemfile
    gem 'redis_failover-rails', github: 'surfdome/redis_failover-rails' # Not in rubygems.org, yet...

 and run bundle install.

    bundle install

## Usage
In your application.rb (or environment), you should use something like:

    config.cache_store = :redis_cache_store, :cache
    config.cache_classes = true
    config.action_controller.perform_caching = true

## Testing
In order to make your tests work, you need a working redis_failover installation, with Redis, Zookeeper and Node Manager running on the ports specified in the default config file.

Also you need a single redis server running on port 6379.

For running the tests, just:

    bundle exec rake

## Configuration
In order to define your redis and redis_failover configurations, you just need to use the `redis.yml` config file.

This follows a format like this:

    environment:
      instance:
        parameter1:
        parameter2:

This gem automatically selects a redis_failover client if you define `:zkservers` in the config file. If not, it just uses the standard redis client.

This are the options available if you configure a redis_failover client:

    :zk            - an existing ZK client instance
    :zkservers     - comma-separated ZooKeeper host:port pairs
    :znode_path    - the Znode path override for redis server list (optional)
    :password      - password for redis nodes (optional)
    :db            - db to use for redis nodes (optional)
    :namespace     - namespace for redis nodes (optional)
    :logger        - logger override (optional)
    :retry_failure - indicate if failures should be retried (default true)
    :max_retries   - max retries for a failure (default 3)
    :safe_mode     - indicates if safe mode is used or not (default true)
    :master_only   - indicates if only redis master is used (default false)
    :verify_role   - verify the actual role of a redis node before every command (default true)

Typical configuration parameters for standard redis clients are:

    :host          - Redis server host
    :port          - Redis server port
    :db            - Redis database to use
    :password      - Redis connection password

Please keep in mind that this options are not validated, just passed to the client configuration.

## License
TODO

## Author
Initially created by Jose Pettoruti - [@jepettoruti](https://github.com/jepettoruti) for Surfdome.com

## Acknowledgements
This couldn't have been achieved without the work of [@ryanlecompte](https://github.com/ryanlecompte/) for making the amazing redis_failover gem.

Special thanks to [@wr0ngway](https://github.com/wr0ngway) for his example on how to implement this on Rubber.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
