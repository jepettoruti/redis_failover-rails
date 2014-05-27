# redis_failover-rails

An ActiveSupport::Cache store using redis_failover (a zookeeper based implementation of HA redis) for Rails apps.

This is based on the work done by [@wr0ngway](https://github.com/wr0ngway) (Matt Conway), available on [redis_failover_example](https://github.com/wr0ngway/redis_failover_example).

Also, this gem utilizes redis_failover, a gem that creates a Redis HA implementation, using zookeeper for mantaining the available nodes.
This can be found on [redis_failover](https://github.com/ryanlecompte/redis_failover).

## Requirements
In order to work, this requires a working [redis_failover](https://github.com/ryanlecompte/redis_failover) implementation. Please follow the instructions on the gem and ask your favourite Sysadmin/DevOps to implement in your environment.

## Considerations
In case you don't have a redis_failover implementation working, and for helping in the development process, this also works with a single node redis server.
Just don't specify zknodes in the config file.

## Installation

    ```ruby
    # Gemfile
    gem 'redis_failover-rails', github: 'surfdome/redis_failover-rails' # Not in rubygems.org, yet...
    ```

## Usage
In your application.rb (or environment), you should use something like:

    ```ruby
    config.cache_store = :redis_cache_store, :cache
    config.cache_classes = true
    config.eager_load = true
    config.action_controller.perform_caching = true
    ```

## Configuration

## License

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
