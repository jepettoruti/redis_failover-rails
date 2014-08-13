module RedisFailover
  Node.class_eval do
    # Safely performs a redis operation within a given timeout window.
    #
    # @yield [Redis] the redis client to use for the operation
    # @raise [NodeUnavailableError] if node is currently unreachable
    def perform_operation
      puts '!!!!!!!!!! Performing op'
      redis = nil
      Timeout.timeout(MAX_OP_WAIT_TIME) do
        redis = new_client
        yield redis
      end
    rescue Exception => ex
      raise NodeUnavailableError, "#{ex.class}: #{ex.message}", ex.backtrace
    ensure
      if redis
        begin
          puts '!!!!!!!!!! Quitting Redis connection.'
          redis.quit
        rescue Exception => ex
          raise NodeUnavailableError, "#{ex.class}: #{ex.message}", ex.backtrace
        end
      end
    end

  end
end
