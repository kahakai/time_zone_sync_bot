defmodule TimeZoneSyncBot.Bot do
  use Telegram.Bot

  @impl Telegram.Bot
  def handle_update(update, token) do
    TimeZoneSyncBot.Handlers.UnknownCommand.handle(token, update)
  end
end
