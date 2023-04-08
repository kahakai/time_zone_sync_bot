defmodule TimeZoneSyncBot.Commands.UpdateTimeZone do
  require Ecto.Query

  def execute(chat_id, label, new_time_zone) do
    query =
      TimeZoneSyncBot.Entry
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> Ecto.Query.where(label: ^label)

    case TimeZoneSyncBot.Repo.one(query) do
      nil ->
        error_messages = %{
          label: ["not found"]
        }

        error_text = TimeZoneSyncBot.Output.Error.format(error_messages)
        {:error, error_text}

      entry ->
        params = %{time_zone: new_time_zone}

        changeset = TimeZoneSyncBot.Entry.changeset(entry, params)

        case TimeZoneSyncBot.Repo.update(changeset) do
          {:ok, updated_entry} ->
            {:ok, TimeZoneSyncBot.Output.UpdateTimeZoneCommand.format(updated_entry)}

          {:error, changeset} ->
            error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
            error_text = TimeZoneSyncBot.Output.Error.format(error_messages)
            {:error, error_text}
        end
    end
  end
end
