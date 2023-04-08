defmodule TimeZoneSyncBot.Output.TimeCommand do
  def format([]) do
    "There are no time zones."
  end

  def format(entries) do
    Enum.reduce(entries, "", fn entry, acc ->
      %TimeZoneSyncBot.Entry{
        label: label,
        time_zone: time_zone
      } = entry

      now = DateTime.now!(time_zone)

      time = TimeZoneSyncBot.Output.Time.strftime(now)

      acc <> "<b>#{label}</b>: #{time}\n"
    end)
  end
end
