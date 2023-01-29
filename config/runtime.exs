import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :time_zone_sync_bot,
  host: "#{System.fetch_env!("APP_NAME")}",
  token: System.fetch_env!("BOT_TOKEN"),
  local_port: System.get_env("PORT", "4000") |> String.to_integer()
