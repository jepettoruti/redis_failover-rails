require 'yaml'

module RedisFailoverRails
  class Settings

    def self.config
      file = './config/redis.yml'
      config = YAML.load(ERB.new(File.read(file)).result)
      config[ENV['RAILS_ENV']]




      # read_yaml = ->(fname) do
      #   begin
      #     YAML.load(File.read(File.expand_path("../#{fname}", __FILE__)))
      #   rescue Errno::ENOENT
      #     {}
      #   end
      # end

      # appconfig = read_yaml.('application.yml')
      # defaults = read_yaml.('application_defaults.yml')
      # CONFIG = defaults.deep_merge(appconfig)
      # CONFIG.merge! CONFIG.fetch(Rails.env, {})
      # CONFIG.symbolize_keys!

    end

    def self.host
      @host ||= config['host']
    end

    def self.port
      @port ||= config['port']
    end

    def self.thread_safe
      @thread_safe ||= config['thread_safe']
    end

    def self.zkservers
      @zkservers ||= config['zkservers']
    end

    def self.znode_path
      @znode_path ||= config['znode_path']
    end

    def self.db
      @db ||= config['db']
    end
  end
end
