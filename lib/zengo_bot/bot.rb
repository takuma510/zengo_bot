module ZengoBot
  class Bot
    def initialize(rest_client)
      @rest_client = rest_client
    end

    def tweet!
      @rest_client.update! 'test'
    end
  end
end
