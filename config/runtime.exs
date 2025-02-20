import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

if config_env() == :prod do
  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  maybe_ipv6 = if System.get_env("ECTO_IPV6") in ~w(true 1), do: [:inet6], else: []

  config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
    # ssl: true,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
    socket_options: maybe_ipv6
end

config :time_zone_sync_bot,
  host: System.fetch_env!("APP_NAME"),
  token: System.fetch_env!("BOT_TOKEN"),
  max_bot_concurrency: System.get_env("BOT_MAX_CONCURRENCY", "1000") |> String.to_integer(),
  local_port: System.get_env("PORT", "4000") |> String.to_integer()
