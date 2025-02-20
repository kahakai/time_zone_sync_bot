import Config

config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "time_zone_sync_bot_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2
