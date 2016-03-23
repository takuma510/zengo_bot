require 'aws-sdk'
require_relative 'zengo'

module ZengoBot
  class ZengoFactory
    class DynamoDBClient
      TABLE_NAME = 'zengo'

      def initialize
        @region = ENV['AWS_REGION'] || 'ap-northeast-1'
        @client = Aws::DynamoDB::Client.new(region: @region)
      end

      # @param month [String]
      # @return [Array]
      def find_by_month(month)
        scan_out = @client.scan scan_opt(month)
        scan_out.items
      end

      # @param month [String]
      # @return [Hash]
      def scan_opt(month)
        {
          table_name: TABLE_NAME,
          scan_filter: {
            month: {
              attribute_value_list: [month],
              comparison_operator: 'EQ'
            }
          }
        }
      end
    end

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
