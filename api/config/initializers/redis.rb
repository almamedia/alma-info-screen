
redis_config = YAML.load_file('config/redis.yml')
$REDIS = Redis.new(host: redis_config[ENV.fetch("RAILS_ENV")]["host"], port: redis_config[ENV.fetch("RAILS_ENV")]["port"])
