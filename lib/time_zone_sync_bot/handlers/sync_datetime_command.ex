defmodule TimeZoneSyncBot.Handlers.SyncDateTimeCommand do
  def handle(token, chat_id, message_id, args) do
    message =
      with {:ok, {label, time}} <- TimeZoneSyncBot.Parsers.SyncDateTimeArguments.parse(args),
           {:ok, message} <- TimeZoneSyncBot.Commands.SyncDateTime.execute(chat_id, label, time) do
        message
      else
        {:error, error_text} ->
          error_text
      end

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: message,
      parse_mode: :HTML
    )
  end
end
