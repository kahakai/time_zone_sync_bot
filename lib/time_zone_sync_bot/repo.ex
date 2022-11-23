defmodule TimeZoneSyncBot.Repo do
  use Ecto.Repo,
    otp_app: :time_zone_sync_bot,
    adapter: Ecto.Adapters.Postgres
end
