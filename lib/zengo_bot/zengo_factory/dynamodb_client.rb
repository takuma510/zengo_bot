require 'aws-sdk'

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

      private
      # @param month [String]
      # @return [Hash]
      def scan_opt(month)
        { table_name: TABLE_NAME,
          scan_filter: {
            month: {
              attribute_value_list: [month],
              comparison_operator: 'EQ' }}}
      end
    end
  end
end
