defmodule TimeZoneSyncBot.Commands.ClearTimeZonesTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "clears time zones" do
    expected = "All time zones have been removed."

    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "America/Los_Angeles")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "Asia/Jerusalem")

    {:ok, message} = TimeZoneSyncBot.Commands.ClearTimeZones.execute(1)

    assert message == expected
  end

  test "clears time zones when the chat ID is not found" do
    expected = "All time zones have been removed."

    {:ok, message} = TimeZoneSyncBot.Commands.ClearTimeZones.execute(0)

    assert message == expected
  end

  test "clears time zones when time zones for the chat ID are not found" do
    expected = "All time zones have been removed."

    {:ok, message} = TimeZoneSyncBot.Commands.ClearTimeZones.execute(0)

    assert message == expected
  end
end
