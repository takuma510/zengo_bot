require_relative '../lib/zengo_bot'

credentials  = ZengoBot::Configuration.credential_env_strings(br = true)
dot_env_path = File.expand_path('../../.env', __FILE__)
File.open(dot_env_path, 'w') { |io| io.print(credentials) }

puts "overwritten #{dot_env_path} as below"
puts credentials
