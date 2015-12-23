require_relative '../libs/configuration'

credentials = ZengoBot::Configuration.credential_env_strings
app_name    = ENV['app'] || 'zengo_bot'

system "heroku config:set #{credentials} --app #{app_name}"
