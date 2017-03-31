# mruby-tbot   

[![Build Status](https://travis-ci.org/nsheremet/mruby-tbot.svg?branch=master)](https://travis-ci.org/nsheremet/mruby-tbot)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/nsheremet/mruby-tbot/blob/master/LICENSE)
[![MRuby Version](https://img.shields.io/badge/mruby-v1.2.0-green.svg)](https://github.com/mruby/mruby)

MRuby wrapper for [Telegram's Bot API](https://core.telegram.org/bots/api).

## Install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|
  conf.gem :github => 'nsheremet/mruby-tbot'
end
```
## Example
```ruby
bot = TBot::Bot.new(telegram_token)

bot.get_bot_data    # return bot info

bot.response        # last request response

bot.messages do |msg|
  msg.class
  #=> Hash

  msg  
  # => {
  #      "message_id": 1,
  #      "from": {
  #        "id": 123,
  #        "first_name": "First Name",
  #        "last_name": "Last Name",
  #        "username": "username"
  #      },
  #      "chat": {
  #        "id": 123456,
  #        "first_name": "First Name",
  #        "last_name": "Last Name",
  #        "username": "username",
  #        "type": "private"
  #      },
  #      "date": 1490955473,
  #      "text": "message text",
  #      "entities": [
  #        {
  #          "type": "bot_command",
  #          "offset": 0,
  #          "length": 6
  #        }
  #      ]
  #    }

  bot.send(msg, 'text message')
end
```

## License
under the MIT License:
- see LICENSE file
