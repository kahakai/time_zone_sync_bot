defmodule TimeZoneSyncBot.Entry do
  use Ecto.Schema

  schema "entries" do
    field(:chat_id, :integer)
    field(:label, :string)
    field(:time_zone, :string)
  end

  def changeset(entry, params \\ %{}) do
    entry
    |> Ecto.Changeset.cast(params, [:chat_id, :label, :time_zone])
    |> Ecto.Changeset.validate_required([:chat_id, :label, :time_zone])
    |> TzExtra.Changeset.validate_time_zone_id(:time_zone)
    |> Ecto.Changeset.unique_constraint([:label, :chat_id])
  end
end
