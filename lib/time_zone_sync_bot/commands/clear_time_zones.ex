defmodule TimeZoneSyncBot.Commands.ClearTimeZones do
  require Ecto.Query

  def execute(chat_id) do
    query =
      TimeZoneSyncBot.TimeZone
      |> Ecto.Query.where(chat_id: ^chat_id)

    TimeZoneSyncBot.Repo.delete_all(query)

    {:ok, "All time zones have been removed."}
  end
end
