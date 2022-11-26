defmodule TimeZoneSyncBot.Commands.RemoveTimeZone do
  require Ecto.Query

  def execute(chat_id, label) do
    time_zone = TimeZoneSyncBot.TimeZone
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> Ecto.Query.where(label: ^label)
      |> TimeZoneSyncBot.Repo.one

    case TimeZoneSyncBot.Repo.delete(time_zone) do
      {:ok, deleted_time_zone} ->
        %TimeZoneSyncBot.TimeZone{
          label: deleted_label,
          location: deleted_location
        } = deleted_time_zone

        {:ok, "#{deleted_label}: #{deleted_location} has been removed."}
      {:error, changeset} ->
        error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
        {:error, error_messages}
    end
  end
end

