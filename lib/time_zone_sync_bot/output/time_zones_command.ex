defmodule TimeZoneSyncBot.Output.TimeZonesCommand do
  def format([]) do
    "There are no time zones."
  end

  def format(time_zones) do
    Enum.reduce(time_zones, "", fn time_zone, acc ->
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      acc <> "<b>#{label}</b>: #{location}\n"
    end)
  end
end
