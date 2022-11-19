defmodule TimeZoneSyncBot.Output do
  def create_time_zones_output(time_zones) do
    for time_zone <- time_zones, into: "" do
      %TimeZone{label: label, location: location} = time_zone
      "<b>#{label}</b>: #{location}\n"
    end
  end
end
  
