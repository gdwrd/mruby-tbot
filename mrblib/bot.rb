module TBot
  class Bot
    include ::Sender

    attr_accessor :token

    API_BOT_URL = "https://api.telegram.org/bot"

    ##
    # initialize Bot
    #
    # Params:
    # - token {String} Telegram Bot Token
    #
    # Response: bot
    #
    def initialize(token)
      if token.nil?
        raise ArgumentError
      else
        @token = token
        @offset = 0
      end
    end

    ##
    # Get Bot Data
    #
    # Response: smallhttp Response
    #
    def get_bot_data
      get_response(api_url(:me))
    end

    ##
    # Get File by ID
    #
    # Params:
    # - file_id {String}
    #
    # Response: smallhttp Response
    #
    def get_file(id)
      get_response(api_url(:file) + id)
    end

    ##
    # Get Messages
    #
    # Params:
    # - block {Block}
    #
    # Response: smallhttp Response
    #
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
      HTTP.new(url).get
    end

    def api_updates_url
      base_url + "/getUpdates?offset=" + @offset.to_s
    end

    def base_url
      API_BOT_URL + @token
    end

    def set_offset(value)
      @offset = value + 1
    end
  end
end
