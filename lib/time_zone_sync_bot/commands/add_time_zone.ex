defmodule TimeZoneSyncBot.Commands.AddTimeZone do
  def execute(chat_id, label, location) do
    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: chat_id,
      label: label,
      location: location
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)

    case TimeZoneSyncBot.Repo.insert(changeset) do
      {:ok, inserted_time_zone} ->
        {:ok, TimeZoneSyncBot.Output.AddTimeZoneCommand.format(inserted_time_zone)}

      {:error, changeset} ->
        error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
        error_text = TimeZoneSyncBot.Output.Error.format(error_messages)
        {:error, error_text}
    end
  end
end
