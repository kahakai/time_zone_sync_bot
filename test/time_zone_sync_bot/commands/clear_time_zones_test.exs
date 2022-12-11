defmodule TimeZoneSyncBot.Commands.ClearTimeZonesTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "clears time zones" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "America/Los_Angeles")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "Asia/Jerusalem")

    assert TimeZoneSyncBot.Commands.ClearTimeZones.execute(1) ==
             {:ok, "All time zones have been removed."}
  end

  test "clears time zones when the chat ID is not found" do
    assert TimeZoneSyncBot.Commands.ClearTimeZones.execute(0) ==
             {:ok, "All time zones have been removed."}
  end

  test "clears time zones when time zones for the chat ID are not found" do
    assert TimeZoneSyncBot.Commands.ClearTimeZones.execute(0) ==
             {:ok, "All time zones have been removed."}
  end
end
