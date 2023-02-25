defmodule TimeZoneSyncBot.Bot do
  use Telegram.Bot

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "text" => "/time_zones",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.TimeZonesCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "text" => "/help",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.HelpCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(update, token) do
    TimeZoneSyncBot.Handlers.UnknownCommand.handle(token, update)
  end
end
