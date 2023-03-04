defmodule TimeZoneSyncBot.Output.DateCommand do
  def format(time_zones) do
    for time_zone <- time_zones, into: "" do
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      now = DateTime.now!(location)

      date = TimeZoneSyncBot.Output.Date.strftime(now)

      "<b>#{label}</b>: #{date}\n"
    end
  end
end
