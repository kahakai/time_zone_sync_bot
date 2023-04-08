defmodule TimeZoneSyncBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_zone_sync_bot,
      version: "0.1.0",
      elixir: "~> 1.14",
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
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:castore, "~> 0.1"},
      {:mint, "~> 1.4"},
      {:tz, "~> 0.26.1"},
      {:tz_extra, "~> 0.26.0"},
      {:telegram, github: "visciang/telegram", tag: "0.22.4"}
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
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
