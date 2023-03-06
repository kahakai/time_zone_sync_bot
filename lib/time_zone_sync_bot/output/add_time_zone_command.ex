defmodule TimeZoneSyncBot.Output.AddTimeZoneCommand do
  def format(new_time_zone) do
    %TimeZoneSyncBot.TimeZone{
      label: label,
      location: location
    } = new_time_zone

    "<b>#{label}</b>: #{location} has been added."
  end
end
