defmodule TimeZoneSyncBot.Output.TimeZonesCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.TimeZone

  test "formats empty time zones to an output string" do
    expected = "There are no time zones."

    time_zones = []

    output = TimeZoneSyncBot.Output.TimeZonesCommand.format(time_zones)

    assert output == expected
  end

  test "formats time zones to an output string" do
    expected = """
    <b>Haifa</b>: Asia/Tel_Aviv
    <b>Warsaw</b>: Europe/Warsaw
    """

    time_zones = [
      %TimeZone{chat_id: 1, label: "Haifa", location: "Asia/Tel_Aviv"},
      %TimeZone{chat_id: 1, label: "Warsaw", location: "Europe/Warsaw"}
    ]

    output = TimeZoneSyncBot.Output.TimeZonesCommand.format(time_zones)

    assert output == expected
  end
end
