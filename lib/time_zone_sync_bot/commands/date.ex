defmodule TimeZoneSyncBot.Commands.Date do
  require Ecto.Query

  def execute(chat_id) do
    entries =
      TimeZoneSyncBot.Entry
      |> Ecto.Query.where(chat_id: ^chat_id)
      |> TimeZoneSyncBot.Repo.all()

    output = TimeZoneSyncBot.Output.DateCommand.format(entries)

    {:ok, output}
  end
end
