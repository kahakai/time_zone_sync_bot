defmodule TimeZoneSyncBot.TimeZoneTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "passes validations and constraints" do
    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      location: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)

    result = TimeZoneSyncBot.Repo.insert(changeset)

    assert match?({:ok, _}, result)
  end

  test "violates validations and constraints" do
    time_zone = %TimeZoneSyncBot.TimeZone{}
    params = %{}
    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: nil,
      label: nil,
      location: nil
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "",
      location: ""
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      location: "Invalid Time Zone"
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      location: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:ok, _}, result)

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      location: "Etc/GMT"
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)
  end
end
