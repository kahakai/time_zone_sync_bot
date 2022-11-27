defmodule TimeZoneSyncBot.Repo.Migrations.CreateTimeZones do
  use Ecto.Migration

  def change do
    create table(:time_zones) do
      add :chat_id, :int8, null: false
      add :label, :text, null: false
      add :location, :text, null: false
    end

    create unique_index(:time_zones, [:label, :chat_id])
  end
end
