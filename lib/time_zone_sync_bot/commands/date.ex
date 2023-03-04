defmodule TimeZoneSyncBot.Commands.Date do
  require Ecto.Query

  def execute(chat_id) do
    time_zones =
      TimeZoneSyncBot.TimeZone
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> TimeZoneSyncBot.Repo.all()

    output = TimeZoneSyncBot.Output.DateCommand.format(time_zones)

    {:ok, output}
  end
end
