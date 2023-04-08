defmodule TimeZoneSyncBot.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :chat_id, :int8, null: false
      add :label, :text, null: false
      add :time_zone, :text, null: false
    end

    create unique_index(:entries, [:label, :chat_id])
  end
end
