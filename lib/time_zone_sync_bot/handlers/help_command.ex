defmodule TimeZoneSyncBot.Handlers.HelpCommand do
  def handle(token, chat_id, message_id) do
    {:ok, message} = TimeZoneSyncBot.Commands.Help.execute()

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: message
    )
  end
end
