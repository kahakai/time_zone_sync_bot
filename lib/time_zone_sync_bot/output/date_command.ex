defmodule TimeZoneSyncBot.Output.DateCommand do
  def format([]) do
    "There are no time zones."
  end

  def format(time_zones) do
    Enum.reduce(time_zones, "", fn time_zone, acc ->
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      now = DateTime.now!(location)

      date = TimeZoneSyncBot.Output.Date.strftime(now)

      acc <> "<b>#{label}</b>: #{date}\n"
    end)
  end
end
