defmodule TimeZoneSyncBot.Handlers.UnknownCommand do
  require Logger

  def handle(token, update) do
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
