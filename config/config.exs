import Config

config :time_zone_sync_bot,
  ecto_repos: [TimeZoneSyncBot.Repo]

import_config "#{config_env()}.exs"
