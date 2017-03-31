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

  bot.send(msg, 'text message', keyboard) # => Hash response
end
