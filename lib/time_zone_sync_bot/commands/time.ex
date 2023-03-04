defmodule TimeZoneSyncBot.Commands.Time do
  require Ecto.Query

  def execute(chat_id) do
    time_zones =
      TimeZoneSyncBot.TimeZone
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> TimeZoneSyncBot.Repo.all()

    output = TimeZoneSyncBot.Output.TimeCommand.format(time_zones)

    {:ok, output}
  end
end
