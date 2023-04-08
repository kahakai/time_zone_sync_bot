defmodule TimeZoneSyncBot.Output.AddTimeZoneCommand do
  def format(new_entry) do
    %TimeZoneSyncBot.Entry{
      label: label,
      time_zone: time_zone
    } = new_entry

    "<b>#{label}</b>: #{time_zone} has been added."
  end
end
