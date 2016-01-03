require_relative '../lib/zengo_bot'

credentials = ZengoBot::Configuration.credential_env_strings
app_name    = ENV['app'] || 'zengo-bot'

system "heroku config:set #{credentials} --app #{app_name}"
