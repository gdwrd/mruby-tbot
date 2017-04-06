module Sender
  # Send Message
  def message(msg, data)
    send_message(api_url(:message), def_dat(msg, data))
  end

  # Send Document
  def document(msg, data)
    send_file(api_url(:document), def_dat(msg, data), inp_hd(data[:document]))
  end

  # Send Photo
  def photo(msg, data)
    send_file(api_url(:photo), def_dat(msg, data), inp_hd(data[:photo]))
  end

  # Send Audio
  def audio(msg, data)
    send_file(api_url(:audio), def_dat(msg, data), inp_hd(data[:audio]))
  end

  # Send Sticker
  def sticker(msg, data)
    send_file(api_url(:sticker), def_dat(msg, data), inp_hd(data[:sticker]))
  end

  # Send Video
  def video(msg, data)
    send_file(api_url(:video), def_dat(msg, data), inp_hd(data[:video]))
  end

  # Send Voice
  def voice(msg, data)
    send_file(api_url(:voice), def_dat(msg, data), inp_hd(data[:voice]))
  end

  # Send Location
  def location(msg, data)
    send_message(api_url(:location), def_dat(msg, data))
  end

  # Send Venue
  def venue(msg, data)
    send_message(api_url(:venue), def_dat(msg, data))
  end

  # Send Contact
  def contact(msg, data)
    send_message(api_url(:contact), def_dat(msg, data))
  end

  # Send Chat Action
  def chat_action(msg, data)
    send_message(api_url(:chat_action), def_dat(msg, data))
  end

private

  def def_dat(msg, params)
    data = { chat_id: msg['chat']['id'] }
    data.merge(params)
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
      chat_action: "/sendChatAction",
      me: "/getMe",
      file: "/getFile"
    }

    base_url + urls[key]
  end
end
