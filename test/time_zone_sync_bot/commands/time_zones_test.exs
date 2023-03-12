defmodule TimeZoneSyncBot.Commands.TimeZonesTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "makes a formatted string of time zones" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Asia/Jerusalem")

    {:ok, _} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "America/Los_Angeles")

    expected = """
    <b>Warsaw</b>: Europe/Warsaw
    <b>Haifa</b>: Asia/Jerusalem
    <b>San_Francisco</b>: America/Los_Angeles
    """

    {:ok, message} = TimeZoneSyncBot.Commands.TimeZones.execute(1)

    assert message == expected
  end

  test "makes a statement string about time zones when the chat ID is not found" do
    expected = "There are no time zones."

    {:ok, message} = TimeZoneSyncBot.Commands.TimeZones.execute(0)

    assert message == expected
  end

  test "makes a statement string about time zones when time zones for the chat ID are not found" do
    expected = "There are no time zones."

    {:ok, message} = TimeZoneSyncBot.Commands.TimeZones.execute(0)

    assert message == expected
  end
end
