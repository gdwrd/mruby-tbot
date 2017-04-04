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

    if !keyboard.empty?
      data[:reply_markup] = { keyboard: keyboard, resize_keyboard: resize, one_time_keyboard: one_time }
    end

    if data[:document].kind_of?(File)
      send_document(api_doc_url, data, {'Content-Type' => 'multipart/form-data'})
    else
      send_document(api_doc_url, data, {'Content-Type' => 'application/json'})
    end
  end

private

  def send_message(url, data)
    HTTP.new(url).post(data, {'Content-Type' => 'application/json'})
  end

  def send_document(url, data, headers = {})
    HTTP.new(url).post(data, headers)
  end

  def api_send_url
    base_url + "/sendMessage"
  end

  def api_doc_url
    base_url + "/sendDocument"
  end
end
