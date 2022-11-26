import Config

config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
  database: "time_zone_sync_bot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

