defmodule TimeZoneSyncBot.Output do
  alias TimeZoneSyncBot.TimeZone

  def create_time_output(time_zones) do
    alias TimeZoneSyncBot.Output.Time

    for time_zone <- time_zones, into: "" do
      %TimeZone{label: label, location: location} = time_zone
      now = DateTime.now!(location)
      time = Time.strftime(now)
      "<b>#{label}</b>: #{time}\n"
    end
  end

  def create_date_output(time_zones) do
    alias TimeZoneSyncBot.Output.Date

    for time_zone <- time_zones, into: "" do
      %TimeZone{label: label, location: location} = time_zone
      now = DateTime.now!(location)
      date = Date.strftime(now)
      "<b>#{label}</b>: #{date}\n"
    end
  end

  def create_time_zones_output(time_zones) do
    for time_zone <- time_zones, into: "" do
      %TimeZone{label: label, location: location} = time_zone
      "<b>#{label}</b>: #{location}\n"
    end
  end
end
