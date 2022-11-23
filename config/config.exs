import Config

config :time_zone_sync_bot, TimeZoneSyncBot.Repo,
  database: "time_zone_sync_bot",
  hostname: "localhost"

config :time_zone_sync_bot,
  ecto_repos: [TimeZoneSyncBot.Repo]

