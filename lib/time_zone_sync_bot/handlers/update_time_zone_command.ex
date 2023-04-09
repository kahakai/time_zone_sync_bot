defmodule TimeZoneSyncBot.Handlers.UpdateTimeZoneCommand do
  def handle(token, chat_id, message_id, args) do
    {label, new_time_zone} = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    message =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(chat_id, label, new_time_zone)
      |> handle_command

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: message,
      parse_mode: :HTML
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
