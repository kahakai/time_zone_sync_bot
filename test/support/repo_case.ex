defmodule TimeZoneSyncBot.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias TimeZoneSyncBot.Repo

      import Ecto
      import Ecto.Query
      import TimeZoneSyncBot.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TimeZoneSyncBot.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TimeZoneSyncBot.Repo, {:shared, self()})
    end

    :ok
  end
end
