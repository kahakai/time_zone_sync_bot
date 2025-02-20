import Config

config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "time_zone_sync_bot_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
