defmodule TimeZoneSyncBot.Output.TimeZonesCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.TimeZone

  test "formats time zones to an output string" do
    time_zones = [
      %TimeZone{chat_id: 1, label: "Haifa", location: "Asia/Tel_Aviv"},
      %TimeZone{chat_id: 1, label: "Warsaw", location: "Europe/Warsaw"}
    ]

    output = """
    <b>Haifa</b>: Asia/Tel_Aviv
    <b>Warsaw</b>: Europe/Warsaw
    """

    assert TimeZoneSyncBot.Output.TimeZonesCommand.format(time_zones) == output
  end
end
