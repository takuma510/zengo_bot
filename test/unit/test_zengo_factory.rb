require_relative '../test_helper'
require_relative '../../lib/zengo_bot'

class TestZengoFactory < MiniTest::Test
  include TestHelper

  def setup
    @factory = ZengoBot::ZengoFactory.new
    stubbing_dynamodb @factory
  end

  def test_today_one
    zengo = @factory.today_one
    assert_equal ZengoBot::Zengo, zengo.class
  end
end
