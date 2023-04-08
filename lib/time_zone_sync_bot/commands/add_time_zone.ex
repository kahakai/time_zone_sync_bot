defmodule TimeZoneSyncBot.Commands.AddTimeZone do
  def execute(chat_id, label, time_zone) do
    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: chat_id,
      label: label,
      time_zone: time_zone
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)

    case TimeZoneSyncBot.Repo.insert(changeset) do
      {:ok, inserted_entry} ->
        {:ok, TimeZoneSyncBot.Output.AddTimeZoneCommand.format(inserted_entry)}

      {:error, changeset} ->
        error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
        error_text = TimeZoneSyncBot.Output.Error.format(error_messages)
        {:error, error_text}
    end
  end
end
