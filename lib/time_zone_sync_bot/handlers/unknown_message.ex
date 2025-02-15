defmodule TimeZoneSyncBot.Handlers.UnknownMessage do
  require Logger

  def handle(_token, update) do
    unknown_message = "Unknown message:\n\n```\n#{inspect(update, pretty: true)}\n```"

    Logger.debug(unknown_message)
  end
end
