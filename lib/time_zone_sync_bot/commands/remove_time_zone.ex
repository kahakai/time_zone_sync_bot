defmodule TimeZoneSyncBot.Commands.RemoveTimeZone do
  require Ecto.Query

  def execute(chat_id, label) do
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
        case TimeZoneSyncBot.Repo.delete(entry) do
          {:ok, deleted_entry} ->
            {:ok, TimeZoneSyncBot.Output.RemoveTimeZoneCommand.format(deleted_entry)}

          {:error, changeset} ->
            error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
            error_text = TimeZoneSyncBot.Output.Error.format(error_messages)
            {:error, error_text}
        end
    end
  end
end
