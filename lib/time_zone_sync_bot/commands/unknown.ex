defmodule TimeZoneSyncBot.Commands.Unknown do
  def execute() do
    IO.puts("Unknown command.")

    TimeZoneSyncBot.Commands.Help.execute()
  end
end

