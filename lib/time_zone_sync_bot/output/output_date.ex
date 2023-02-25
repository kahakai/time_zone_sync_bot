defmodule TimeZoneSyncBot.Output.Date do
  @string_format "%Y-%m-%d"

  def strftime(datetime) do
    Calendar.strftime(datetime, @string_format)
  end
end
