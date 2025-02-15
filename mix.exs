defmodule TimeZoneSyncBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_zone_sync_bot,
      version: "0.1.0",
      elixir: "~> 1.18.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
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
      {:ecto, "~> 3.12.5"},
      {:ecto_sql, "~> 3.12.1"},
      {:postgrex, ">= 0.0.0"},
      {:castore, "~> 1.0.11"},
      {:mint, "~> 1.7.1"},
      {:tz, "~> 0.28.1"},
      {:tz_extra, "~> 0.45.0"},
      {:bandit, "~> 1.5.7"},
      {:telegram, github: "visciang/telegram", tag: "2.0.0"}
    ]
  end

  defp elixirc_paths(:test) do
    [
      "lib",
      "test/support"
    ]
  end

  defp elixirc_paths(_) do
    [
      "lib"
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
