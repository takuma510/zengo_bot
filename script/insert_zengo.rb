require 'aws-sdk'
require 'dotenv'

unless ARGV.length == 4
  raise ArgumentError.new "bundle exec ruby #{__FILE__} word yomi month reference"
end

Dotenv.load
word, yomi, month, reference = ARGV
dynamodb_client = Aws::DynamoDB::Client.new(region: 'ap-northeast-1')

dynamodb_client.put_item(
  table_name: 'zengo',
  item: {
    'word'      => word,
    'yomi'      => yomi,
    'month'     => month,
    'reference' => reference
  }
)

puts "#{word}(#{yomi}) by #{reference} on #{month}"
