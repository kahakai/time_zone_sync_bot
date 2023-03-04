defmodule TimeZoneSyncBot.Output.TimeZonesCommand do
  def format(time_zones) do
    for time_zone <- time_zones, into: "" do
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      "<b>#{label}</b>: #{location}\n"
    end
  end
end
