defmodule TimeZoneSyncBot.Output.DateTimeCommand do
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

      date = TimeZoneSyncBot.Output.Date.strftime(now)
      time = TimeZoneSyncBot.Output.Time.strftime(now)

      acc <> "<b>#{label}</b>: #{date} #{time}\n"
    end)
  end
end
