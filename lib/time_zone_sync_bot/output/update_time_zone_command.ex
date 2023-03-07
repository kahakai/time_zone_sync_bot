defmodule TimeZoneSyncBot.Output.UpdateTimeZoneCommand do
  def format(updated_time_zone) do
    %TimeZoneSyncBot.TimeZone{
      label: label,
      location: location
    } = updated_time_zone

    "<b>#{label}</b> has been updated with #{location}."
  end
end
