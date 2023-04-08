defmodule TimeZoneSyncBot.Output.UpdateTimeZoneCommand do
  def format(updated_entry) do
    %TimeZoneSyncBot.Entry{
      label: label,
      time_zone: time_zone
    } = updated_entry

    "<b>#{label}</b> has been updated with #{time_zone}."
  end
end
