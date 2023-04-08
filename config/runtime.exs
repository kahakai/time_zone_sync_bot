import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :time_zone_sync_bot,
  host: System.fetch_env!("APP_NAME"),
  token: System.fetch_env!("BOT_TOKEN"),
  max_bot_concurrency: System.get_env("BOT_MAX_CONCURRENCY", "1000") |> String.to_integer(),
  local_port: System.get_env("PORT", "4000") |> String.to_integer()

config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
  url: System.get_env("DATABASE_URL", "ecto://localhost/time_zone_sync_bot_#{config_env()}")
