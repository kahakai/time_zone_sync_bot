defmodule TimeZoneSyncBot.Handlers.RemoveTimeZoneCommand do
  def handle(token, chat_id, message_id, args) do
    {label} = TimeZoneSyncBot.Parsers.RemoveTimeZoneArguments.parse(args)

    message =
      TimeZoneSyncBot.Commands.RemoveTimeZone.execute(chat_id, label)
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

      {:error, error_messages} ->
        TimeZoneSyncBot.Output.Error.create_error_output(error_messages)
    end
  end
end
