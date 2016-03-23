require 'aws-sdk'
require 'minitest'
require 'minitest/autorun'

module TestHelper
  def stubbing_dynamodb(zengo_factory)
    client = Aws::DynamoDB::Client.new(stub_responses: true)
    client.stub_responses(
      :scan,
      items: [
        { 'word' => 'dummy', 'yomi' => 'dummy', 'reference' => 'dummy' }
      ])
    zengo_factory.instance_eval do
      @client.instance_variable_set(:@client, client)
    end
  end
end
