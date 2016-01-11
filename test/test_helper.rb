require 'aws-sdk'
require 'minitest'
require 'minitest/autorun'

module TestHelper
  # stubbing dynamodb
  def stubbing_dynamodb
    ZengoBot::Zengo.class_eval do
      @client = Aws::DynamoDB::Client.new(stub_responses: true)
      @client.stub_responses(:scan,
        items: [
          { 'word' => 'dummy', 'yomi' => 'dummy', 'reference' => 'dummy' }
        ])
    end
  end
end
