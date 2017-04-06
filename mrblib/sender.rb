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

    send_message(api_url(:message), data)
  end

  # Send Document
  def document(msg, document, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      document: document,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:document), data, inp_hd(data[:document]))
  end

  # Send Photo
  def photo(msg, photo, caption = nil, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      photo: photo,
      caption: caption,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:photo), data, inp_hd(data[:photo]))
  end

  # Send Audio
  def audio(msg, audio, caption = nil, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      audio: audio,
      caption: caption,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:audio), data, inp_hd(data[:audio]))
  end

  # Send Sticker
  def sticker(msg, sticker, caption = nil, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      sticker: sticker,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:sticker), data, inp_hd(data[:sticker]))
  end

  # Send Video
  def video(msg, video, caption = nil, is_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      video: video,
      caption: caption,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:video), data, inp_hd(data[:video]))
  end

  # Send Voice
  def voice(msg, voice, caption = nil, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat_id']['id'],
      voice: voice,
      caption: caption,
      disable_notification: dis_not
    }

    data = k_add(data, rm)
    send_file(api_url(:voice), data, inp_hd(data[:voice]))
  end

  # Send Location
  def location(msg, loc, dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      latitude: loc[:lat],
      longitude: loc[:lng]
    }

    data = k_add(data, rm)
    send_message(api_url(:location), data)
  end

  # Send Venue
  def venue(msg, loc, t, addr, f_id = "", dis_not = false, rm = {})
    data = {
      chat_id: msg['chat']['id'],
      latitude: loc[:lat],
      longitude: loc[:lng],
      title: t,
      address: addr,
      foursquare_id: f_id
    }

    data = k_add(data, rm)
    send_message(api_url(:venue), data)
  end

  # Send Contact
  def contact(msg, phone, f_name, l_name, dis_not = false, rm ={})
    data = {
      chat_id: msg['chat']['id'],
      phone_number: phone,
      first_name: f_name,
      last_name: l_name,
    }

    data = k_add(data, rm)
    send_message(api_url(:contact), data)
  end

  # Send Chat Action
  def chat_action(msg, action = typing)
    data = {
      chat_id: msg['chat']['id'],
      action: action,
    }

    send_message(api_url(:chat_action), data)
  end

private

  def k_add(data, r_m)
    data[:reply_markup] = r_m unless r_m.empty?
    return data
  end

  def inp_hd(data)
    data.kind_of?(File) ? {'Content-Type' => 'multipart/form-data'} : {'Content-Type' => 'application/json'}
  end

  def send_message(url, data)
    HTTP.new(url).post(data, {'Content-Type' => 'application/json'})
  end

  def send_file(url, data, headers = {})
    HTTP.new(url).post(data, headers)
  end

  def api_url(key)
    urls = {
      message: "/sendMessage",
      document: "/sendDocument",
      photo: "/sendPhoto",
      sticker: "/sendSticker",
      video: "/sendVideo",
      location: "/sendLocation",
      venue: "/sendVenue",
      contact: "/sendContact",
      chat_action: "/sendChatAction"
    }

    base_url + urls[key]
  end
end
