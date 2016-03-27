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
      zengo_list = this_month_list + non_month_list
      select_one zengo_list
    end

    private
    # @return [Array]
    def this_month_list
      @client.find_by_month Time.now.month.to_s
    end

    # @return [Array]
    def non_month_list
      @client.find_by_month '0'
    end

    # @param zengo_list [Array]
    # @return [Zengo]
    def select_one(zengo_list)
      rand_index = Random.rand zengo_list.count
      Zengo.new zengo_list[rand_index]
    end
  end
end
