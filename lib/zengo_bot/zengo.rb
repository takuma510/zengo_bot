require 'aws-sdk'

module ZengoBot
  # An instance represents one DynamoDB item
  class Zengo

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
      super unless %w( word yomi reference ).include? name_string
      @item[name_string]
    end
  end
end
