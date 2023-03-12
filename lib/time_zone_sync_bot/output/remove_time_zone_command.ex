defmodule TimeZoneSyncBot.Output.RemoveTimeZoneCommand do
  def format(deleted_time_zone) do
    %TimeZoneSyncBot.TimeZone{
      label: label,
      location: location
    } = deleted_time_zone

    "<b>#{label}</b>: #{location} has been removed."
  end
end
