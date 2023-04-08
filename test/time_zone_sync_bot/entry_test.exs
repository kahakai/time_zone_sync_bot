defmodule TimeZoneSyncBot.EntryTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "passes validations and constraints" do
    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      time_zone: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)

    result = TimeZoneSyncBot.Repo.insert(changeset)

    assert match?({:ok, _}, result)
  end

  test "violates validations and constraints" do
    entry = %TimeZoneSyncBot.Entry{}
    params = %{}
    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: nil,
      label: nil,
      time_zone: nil
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "",
      time_zone: ""
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      time_zone: "Invalid Time Zone"
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      time_zone: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:ok, _}, result)

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "Test Label",
      time_zone: "Etc/GMT"
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)
    result = TimeZoneSyncBot.Repo.insert(changeset)
    assert match?({:error, _}, result)
  end
end
