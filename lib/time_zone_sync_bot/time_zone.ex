defmodule TimeZoneSyncBot.TimeZone do
  use Ecto.Schema

  @enforce_keys [
    :chat_id,
    :label,
    :location
  ]

  schema "time_zones" do
    field(:chat_id, :integer)
    field(:label, :string)
    field(:location, :string)
  end

  def changeset(time_zone, params \\ %{}) do
    time_zone
    |> Ecto.Changeset.cast(params, [:chat_id, :label, :location])
    |> Ecto.Changeset.validate_required([:chat_id, :label, :location])
    |> TzExtra.Changeset.validate_time_zone(:location)
    |> Ecto.Changeset.unique_constraint([:label, :chat_id])
  end
end
