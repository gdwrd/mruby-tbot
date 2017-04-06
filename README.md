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
  msg.class # => Hash

  puts msg
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

  # custom keyboard for Reply Markup
  keyboard = [
    ['Hello!', 'Bye!'],
    ['Exit', 'Docs']
  ] #=> Array

  # ReplyKeyboardMarkup
  reply_markup = {
    keyboard: keyboard,
    resize_keyboard: true,
    one_time_keyboard: true,
    selective: true
  }

  # Send Message
  bot.message(msg, { text: 'text message', reply_markup: reply_markup }) # => Hash response
end
```

### Send Document
```ruby
bot.document(message, { document: File.open('document.doc','rb') })
```

### Send Photo
```ruby
bot.photo(message, { photo: File.open('photo.jpeg','rb') })
```

### Send Sticker
```ruby
bot.sticker(message, { sticker: File.open('sticker.png','rb') })
```

### Send Audio
```ruby
bot.audio(message, { sticker: File.open('audio.mp3','rb') })
```

### Send Voice
```ruby
bot.voice(message, { sticker: File.open('voice.mp3','rb') })
```

### Send location
```ruby
bot.location(message, { latitude: 54.44, longitude: 80.0 })
```

### Send Venue
```ruby
bot.venue(message, { latitude: 50.00, longitude: 80.0, title: "Name", address: "Address" })
```

### Send Contact
```ruby
bot.contact(message, { phone_number: "+123456789010", first_name: "Name", last_name: "Test" })
```

### Send Chat Action
```ruby
bot.chat_action(message, { action: "typing" })
```

## License
Under the MIT License:
- see LICENSE file
