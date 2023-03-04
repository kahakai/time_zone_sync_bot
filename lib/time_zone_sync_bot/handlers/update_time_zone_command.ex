defmodule TimeZoneSyncBot.Handlers.UpdateTimeZoneCommand do
  def handle(token, chat_id, message_id, args) do
    {label, new_location} = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    message =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(chat_id, label, new_location)
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
