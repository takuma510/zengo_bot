require 'aws-sdk'

module ZengoBot
  # An instance represents one DynamoDB item
  class Zengo
    TABLE_NAME = 'zengo'

    @client = Aws::DynamoDB::Client.new

    # @return [Zengo]
    def self.today_one
      zengo_list = find_by_month Time.now.month.to_s
      select_one zengo_list
    end

    # @param month [String]
    # @return [Array]
    def self.find_by_month(month)
      scan_opt = {
        table_name: TABLE_NAME,
        scan_filter: {
          month: {
            attribute_value_list: [month],
            comparison_operator: 'EQ'
          }
        }
      }

      scan_out = @client.scan scan_opt
      scan_out.items
    end

    # @param zengo_list [Array]
    # @return [Zengo]
    def self.select_one(zengo_list)
      rand_index = Random.rand zengo_list.count
      new zengo_list[rand_index]
    end

    # @param [Hash]
    def initialize(item)
      @item = item
    end

    # @return [String]
    def build_sentence
      "#{word} (#{yomi}) by #{reference}"
    end

    def method_missing(name)
      name_string = name.to_s
      super unless %w{word yomi reference}.include? name_string
      @item[name_string]
    end
  end
end
