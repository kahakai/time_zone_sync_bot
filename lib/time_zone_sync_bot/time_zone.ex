defmodule TimeZoneSyncBot.TimeZone do
  use Ecto.Schema

  schema "time_zones" do
    field :chat_id, :integer
    field :label, :string
    field :location, :string
  end
end
