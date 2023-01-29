defmodule TimeZoneSyncBot.Bot do
  require Logger

  use Telegram.Bot

  @impl Telegram.Bot
  def handle_update(update, token) do
    case update do
      %{
        "message" => %{
          "message_id" => message_id,
          "chat" => %{
            "id" => chat_id
          }
        }
      } ->
        {:ok, message} = TimeZoneSyncBot.Commands.Unknown.execute()

        Telegram.Api.request(token, "sendMessage",
          chat_id: chat_id,
          reply_to_message_id: message_id,
          text: message
        )

      _ ->
        unknown_message = "Unknown message:\n\n```\n#{inspect(update, pretty: true)}\n```"

        Logger.debug(unknown_message)
    end
  end
end
