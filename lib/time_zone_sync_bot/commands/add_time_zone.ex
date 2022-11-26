defmodule TimeZoneSyncBot.Commands.AddTimeZone do
  def execute(chat_id, label, location) do
    time_zone = %TimeZoneSyncBot.TimeZone{
      chat_id: chat_id,
      label: label,
      location: location
    }
    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone)

    case TimeZoneSyncBot.Repo.insert(changeset) do
      {:ok, inserted_time_zone} ->
        %TimeZoneSyncBot.TimeZone{
          label: inserted_label,
          location: inserted_location
        } = inserted_time_zone

        {:ok, "#{inserted_label}: #{inserted_location} has been added."}
      {:error, changeset} ->
        error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)
        {:error, error_messages}
    end
  end
end

