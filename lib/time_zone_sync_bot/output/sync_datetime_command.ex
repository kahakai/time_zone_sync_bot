defmodule TimeZoneSyncBot.Output.SyncDateTimeCommand do
  def format([]) do
    "There are no time zones."
  end

  def format(labeled_datetimes) do
    Enum.reduce(labeled_datetimes, "", fn entry, acc ->
      %{
        label: label,
        datetime: datetime
      } = entry

      date = TimeZoneSyncBot.Output.Date.strftime(datetime)
      time = TimeZoneSyncBot.Output.Time.strftime(datetime)

      acc <> "<b>#{label}</b>: #{date} #{time}\n"
    end)
  end
end
