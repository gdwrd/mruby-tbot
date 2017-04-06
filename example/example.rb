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

  # Send Document
  bot.document(message, { document: File.open('document.doc','rb') })

  # Send Photo
  bot.photo(message, { photo: File.open('photo.jpeg','rb') })

  # Send Sticker
  bot.sticker(message, { sticker: File.open('sticker.png','rb') })

  # Send Audio
  bot.audio(message, { sticker: File.open('audio.mp3','rb') })

  # Send Voice
  bot.voice(message, { sticker: File.open('voice.mp3','rb') })

  # Send location
  bot.location(message, { latitude: 34.44, longitude: 80.0 })

  # Send Venue
  bot.venue(message, { latitude: 50.5117412, longitude: 30.5044844, title: "Argentina Grill", address: "Obolon" })

  # Send Contact
  bot.contact(message, { phone_number: "+380631331477", first_name: "Nazar", last_name: "Sh" })

  # Send Chat Action
  bot.chat_action(message, { action: "typing" })
end
