defmodule TimeZoneSyncBot.Commands.TimeZonesTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "returns a formatted string of time zones" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Asia/Jerusalem")

    {:ok, _} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "America/Los_Angeles")

    output = """
    <b>Warsaw</b>: Europe/Warsaw
    <b>Haifa</b>: Asia/Jerusalem
    <b>San_Francisco</b>: America/Los_Angeles
    """

    assert TimeZoneSyncBot.Commands.TimeZones.execute(1) == {:ok, output}
  end

  test "returns an empty string of time zones when the chat ID is not found" do
    output = ""

    assert TimeZoneSyncBot.Commands.TimeZones.execute(0) == {:ok, output}
  end

  test "returns an empty string of time zones when time zones for the chat ID are not found" do
    output = ""

    assert TimeZoneSyncBot.Commands.TimeZones.execute(0) == {:ok, output}
  end
end
