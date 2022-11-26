defmodule TimeZoneSyncBot.Output.Time do
  @string_format "%H:%M (%z)"

  def strftime(datetime) do
    Calendar.strftime(datetime, @string_format)
  end
end
