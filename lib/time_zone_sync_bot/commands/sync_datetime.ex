defmodule TimeZoneSyncBot.Commands.SyncDateTime do
  require Ecto.Query

  def execute(chat_id, label, time) do
    time_zone =
      TimeZoneSyncBot.Entry
      |> TimeZoneSyncBot.Repo.get_by(chat_id: chat_id, label: label)

    output =
      case time_zone do
        %TimeZoneSyncBot.Entry{time_zone: time_zone} ->
          datetime = DateTime.new!(Date.utc_today(), time, time_zone)

          labeled_datetimes =
            TimeZoneSyncBot.Entry
            |> Ecto.Query.where(chat_id: ^chat_id)
            |> TimeZoneSyncBot.Repo.all()
            |> Enum.map(fn entry ->
              %{
                label: entry.label,
                datetime: DateTime.shift_zone!(datetime, entry.time_zone)
              }
            end)

          TimeZoneSyncBot.Output.SyncDateTimeCommand.format(labeled_datetimes)

        nil ->
          "There are no time zones for #{label}."
      end

    {:ok, output}
  end
end
