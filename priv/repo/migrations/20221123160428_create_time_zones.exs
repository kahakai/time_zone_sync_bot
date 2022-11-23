defmodule TimeZoneSyncBot.Repo.Migrations.CreateTimeZones do
  use Ecto.Migration

  def change do
    create table(:time_zones) do
      add :chat_id, :int8
      add :label, :text
      add :location, :text
    end
  end
end
