defmodule TimeZoneSyncBot.Output.RemoveTimeZoneCommand do
  def format(deleted_entry) do
    %TimeZoneSyncBot.Entry{
      label: label,
      time_zone: time_zone
    } = deleted_entry

    "<b>#{label}</b>: #{time_zone} has been removed."
  end
end
