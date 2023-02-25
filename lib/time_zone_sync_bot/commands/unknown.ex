defmodule TimeZoneSyncBot.Commands.Unknown do
  @unknown_command "Unknown command."

  def execute() do
    {:ok, message} = TimeZoneSyncBot.Commands.Help.execute()
    {:ok, "#{@unknown_command}\n\n" <> message}
  end
end
