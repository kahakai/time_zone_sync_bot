defmodule TimeZoneSyncBot.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field(:chat_id, :integer)
    field(:label, :string)
    field(:time_zone, :string)
  end

  @doc false
  def changeset(entry, attrs \\ %{}) do
    entry
    |> cast(attrs, [:chat_id, :label, :time_zone])
    |> validate_required([:chat_id, :label, :time_zone])
    |> TzExtra.Changeset.validate_time_zone_id(:time_zone)
    |> unique_constraint([:label, :chat_id])
  end
end
