require_relative '../test_helper'
require_relative '../../lib/zengo_bot'

class TestZengo < MiniTest::Test
  include TestHelper

  def setup
    stubbing_dynamodb
  end

  def test_today_one
    zengo = ZengoBot::Zengo.today_one
    assert_equal ZengoBot::Zengo, zengo.class
  end
end
