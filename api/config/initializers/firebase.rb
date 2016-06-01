firebase_config = YAML.load_file('config/firebase.yml')
FIREBASE = Firebase::Client.new(firebase_config[ENV.fetch("RAILS_ENV")]["base_uri"], firebase_config[ENV.fetch("RAILS_ENV")]["secret"])

