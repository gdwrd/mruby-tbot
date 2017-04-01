module TBot
  class Bot
    include ::Sender

    attr_accessor :token, :http

    API_BOT_URL = "https://api.telegram.org/bot"

    def initialize(token)
      if token.nil?
        raise ArgumentError
      else
        @token = token
        @http = HttpRequest.new
        @offset = TBot::Helper.get_offset
      end
    end

    def get_bot_data
      @response = get_response(api_me_url)
    end

    def messages(&block)
      unless block_given?
        raise ArgumentError
      end

      while true do
        @response = get_response(api_updates_url)
        data = JSON::parse(@response.body)

        data['result'].each do |update|
          block.call(update["message"])

          set_offset(update['update_id'])
        end

        Sleep::sleep(2)
      end
    end

  private

    def get_response(url)
      @http.get(url)
    end

    def api_me_url
      base_url + "/getMe"
    end

    def api_updates_url
      base_url + "/getUpdates?offset=" + @offset.to_s
    end

    def base_url
      API_BOT_URL + @token
    end

    def set_offset(value)
      @offset = value + 1
      TBot::Helper.update_offset(@offset)
    end
  end
end
