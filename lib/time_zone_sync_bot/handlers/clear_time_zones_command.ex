defmodule TimeZoneSyncBot.Handlers.ClearTimeZonesCommand do
  def handle(token, chat_id, message_id) do
    message =
      TimeZoneSyncBot.Commands.ClearTimeZones.execute(chat_id)
      |> handle_command

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: message
    )
  end

  defp handle_command(result) do
    case result do
      {:ok, message} ->
        message

      {:error, error_text} ->
        error_text
    end
  end
end
