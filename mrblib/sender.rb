module Sender
  # Send Message
  def message(msg, text, keyboard = [], resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      text: text,
      reply_markup: {
        keyboard: keyboard,
        resize_keyboard: resize,
        one_time_keyboard: one_time
      }
    }

    send_message(api_send_url, data)
  end

  # Send Document
  def document(msg, document, keyboard = [], dis_not = false, resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      document: document,
      disable_notification: dis_not
    }

    data = keyboard_add(data, keyboard)
    send_file(api_doc_url, data, header_for_input(data[:document]))
  end

  # Send Photo
  def photo(msg, photo, caption = nil, keyboard = [], dis_not = false, resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      photo: photo,
      caption: caption,
      disable_notification: dis_not
    }

    data = keyboard_add(data, keyboard)
    send_file(api_photo_url, data, header_for_input(data[:photo]))
  end

  # Send Audio
  def audio(msg, audio, caption = nil, keyboard = [], dis_not = false, resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      audio: audio,
      caption: caption,
      disable_notification: dis_not
    }

    data = keyboard_add(data, keyboard)
    send_file(api_photo_url, data, header_for_input(data[:audio]))
  end

  # Send Sticker
  def sticker(msg, sticker, caption = nil, keyboard = [], dis_not = false, resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      sticker: sticker,
      disable_notification: dis_not
    }

    data = keyboard_add(data, keyboard)
    send_file(api_photo_url, data, header_for_input(data[:audio]))
  end

private

  def keyboard_add(data, keyboard)
    data[:reply_markup] = { keyboard: keyboard, resize_keyboard: resize, one_time_keyboard: one_time } unless keyboard.empty?
    return data
  end

  def header_for_input(data)
    data.kind_of?(File) ? {'Content-Type' => 'multipart/form-data'} : {'Content-Type' => 'application/json'}
  end

  def send_message(url, data)
    HTTP.new(url).post(data, {'Content-Type' => 'application/json'})
  end

  def send_file(url, data, headers = {})
    HTTP.new(url).post(data, headers)
  end

  def api_send_url
    base_url + "/sendMessage"
  end

  def api_doc_url
    base_url + "/sendDocument"
  end

  def api_photo_url
    base_url + "/sendPhoto"
  end
end
