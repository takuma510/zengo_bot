require_relative '../test_helper'
require_relative '../../lib/zengo_bot'

class TestBot < MiniTest::Test
  include TestHelper

  def setup
    @mock_client = MiniTest::Mock.new
    @zengo_factory = ZengoBot::ZengoFactory.new
    stubbing_dynamodb @zengo_factory
    @zengo = @zengo_factory.today_one
  end

  def test_tweet
    @mock_client.expect(:update!, true, [@zengo.build_sentence])
    bot = ZengoBot::Bot.new @mock_client, @zengo_factory
    bot.tweet!
    assert @mock_client.verify
  end
end
