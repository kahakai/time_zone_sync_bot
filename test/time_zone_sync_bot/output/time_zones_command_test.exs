defmodule TimeZoneSyncBot.Output.TimeZonesCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.Entry

  test "formats empty list of entries to an output string" do
    expected = "There are no time zones."

    entries = []

    output = TimeZoneSyncBot.Output.TimeZonesCommand.format(entries)

    assert output == expected
  end

  test "formats entries to an output string" do
    expected = """
    <b>Haifa</b>: Asia/Tel_Aviv
    <b>Warsaw</b>: Europe/Warsaw
    """

    entries = [
      %Entry{chat_id: 1, label: "Haifa", time_zone: "Asia/Tel_Aviv"},
      %Entry{chat_id: 1, label: "Warsaw", time_zone: "Europe/Warsaw"}
    ]

    output = TimeZoneSyncBot.Output.TimeZonesCommand.format(entries)

    assert output == expected
  end
end
