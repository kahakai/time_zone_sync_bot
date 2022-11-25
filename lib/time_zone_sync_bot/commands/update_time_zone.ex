defmodule TimeZoneSyncBot.Commands.UpdateTimeZone do
  require Ecto.Query

  def execute(chat_id, label, new_location) do
    time_zone = TimeZoneSyncBot.TimeZone
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> Ecto.Query.where(label: ^label)
      |> TimeZoneSyncBot.Repo.one

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, %{location: new_location})

    case TimeZoneSyncBot.Repo.update(changeset) do
      {:ok, updated_time_zone} ->
        %TimeZoneSyncBot.TimeZone{
          label: updated_label,
          location: updated_location
        } = updated_time_zone

        {:ok, "#{updated_label} has been updated with #{updated_location}."}
      {:error, message} ->
        {:error, message}
    end
  end
end

