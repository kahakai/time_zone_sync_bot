defmodule TimeZoneSyncBot.Output.TimeCommand do
  def format(time_zones) do
    for time_zone <- time_zones, into: "" do
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      now = DateTime.now!(location)

      time = TimeZoneSyncBot.Output.Time.strftime(now)

      "<b>#{label}</b>: #{time}\n"
    end
  end
end
