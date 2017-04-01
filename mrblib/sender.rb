module Sender
  # Send Message
  def send_message(msg, text, keyboard = [], resize = false, one_time = false)
    data = {
      chat_id: msg['chat']['id'],
      text: text,
      reply_markup: {
        keyboard: keyboard,
        resize_keyboard: resize,
        one_time_keyboard: one_time
      }
    }

    send_post(api_send_url, data)
  end

  def send_post(url, data)
    @response = @http.post(url, JSON::stringify(data), {'Content-Type' => 'application/json'})
  end

  def api_send_url
    base_url + "/sendMessage"
  end
end
