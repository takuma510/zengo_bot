require 'aws-sdk'
require_relative 'zengo'
require_relative 'zengo_factory/dynamodb_client'

module ZengoBot
  class ZengoFactory
    def initialize
      @client = DynamoDBClient.new
    end

    # @return [Zengo]
    def today_one
      zengo_list = @client.find_by_month Time.now.month.to_s
      select_one zengo_list
    end

    private
    # @param zengo_list [Array]
    # @return [Zengo]
    def select_one(zengo_list)
      rand_index = Random.rand zengo_list.count
      Zengo.new zengo_list[rand_index]
    end
  end
end
