defmodule TimeZoneSyncBot.Commands.ClearTimeZones do
  require Ecto.Query

  def execute(chat_id) do
    query =
      TimeZoneSyncBot.Entry
      |> Ecto.Query.where(chat_id: ^chat_id)

    TimeZoneSyncBot.Repo.delete_all(query)

    {:ok, TimeZoneSyncBot.Output.ClearTimeZonesCommand.format()}
  end
end
