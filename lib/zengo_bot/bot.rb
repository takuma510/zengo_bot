require_relative 'zengo'

module ZengoBot
  class Bot
    def initialize(rest_client)
      @rest_client = rest_client
    end

    def tweet!
      zengo = Zengo.today_one
      @rest_client.update! zengo.build_sentence
    end
  end
end
