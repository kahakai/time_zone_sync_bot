defmodule TimeZoneSyncBot.Handlers.AddTimeZoneCommand do
  def handle(token, chat_id, message_id, args) do
    {label, time_zone} = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    message =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(chat_id, label, time_zone)
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
