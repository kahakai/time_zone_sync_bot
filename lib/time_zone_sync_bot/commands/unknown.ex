defmodule TimeZoneSyncBot.Commands.Unknown do
  @unknown "Unknown command.\n\n"

  def execute() do
    {:ok, message} = TimeZoneSyncBot.Commands.Help.execute()
    {:ok, @unknown <> message}
  end
end

