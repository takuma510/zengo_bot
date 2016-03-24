module ZengoBot
  class Bot
    def initialize(client, zengo_factory)
      @client = client
      @zengo_factory = zengo_factory
    end

    def tweet!
      zengo = @zengo_factory.today_one
      @client.update! zengo.build_sentence
    end
  end
end
