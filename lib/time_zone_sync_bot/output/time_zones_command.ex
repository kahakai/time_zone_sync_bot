defmodule TimeZoneSyncBot.Output.TimeZonesCommand do
  def format([]) do
    "There are no time zones."
  end

  def format(entries) do
    Enum.reduce(entries, "", fn entry, acc ->
      %TimeZoneSyncBot.Entry{
        label: label,
        time_zone: time_zone
      } = entry

      acc <> "<b>#{label}</b>: #{time_zone}\n"
    end)
  end
end
