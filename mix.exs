defmodule TimeZoneSyncBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_zone_sync_bot,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TimeZoneSyncBot.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:castore, "~> 0.1"},
      {:mint, "~> 1.4"},
      {:tz, "~> 0.24.0"}
    ]
  end
end
