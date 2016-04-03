# ZengoBot

A bot tweets zen word.

[![Build Status](https://travis-ci.org/takuma510/zengo_bot.svg)](https://travis-ci.org/takuma510/zengo_bot)

## Usage

tweets from local.

    $ bundle exec ruby script/set_local_env.rb
    $ heroku local

run unit tests.

    $ bundle exec rake

put zengo item.

    $ bundle exec ruby script/set_local_env.rb
    $ bundle exec ruby script/insert_zengo.rb word yomi month reference
