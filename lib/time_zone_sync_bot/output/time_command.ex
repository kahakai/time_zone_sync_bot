defmodule TimeZoneSyncBot.Output.TimeCommand do
  def format(time_zones) do
    Enum.reduce(time_zones, "", fn time_zone, acc ->
      %TimeZoneSyncBot.TimeZone{
        label: label,
        location: location
      } = time_zone

      now = DateTime.now!(location)

      time = TimeZoneSyncBot.Output.Time.strftime(now)

      acc <> "<b>#{label}</b>: #{time}\n"
    end)
  end
end
