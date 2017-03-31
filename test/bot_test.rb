def run_with_catching_error(&b)
  e = nil
  begin
    b.call
  rescue => _e
    e = _e
  end

  return e
end

TOKEN = ENV['TELEGRAM_TOKEN']

assert("bot would not accept nil token") do
  e = run_with_catching_error { TBot::Bot.new(nil) }

  assert_equal e.class, ArgumentError
end

assert("bot has access to the attributes") do
  bot = TBot::Bot.new(TOKEN)

  assert_equal bot.token, TOKEN
  assert_equal bot.http.class, HttpRequest
end

assert("bot return response") do
  bot = TBot::Bot.new(TOKEN)
  data = JSON::parse(bot.get_bot_data.body)

  assert_equal data["ok"], true
end

assert("bot messages required block") do
  bot = TBot::Bot.new(TOKEN)
  e = run_with_catching_error { bot.messages }

  assert_equal e.class, ArgumentError
end

assert("bot send messages") do
  bot = TBot::Bot.new(TOKEN)
  response = bot.send({'chat' => {'id' => 1}}, 'test')
  data = JSON::parse(response.body)

  assert_equal data["ok"], false
  assert_equal data['error_code'], 400
end
