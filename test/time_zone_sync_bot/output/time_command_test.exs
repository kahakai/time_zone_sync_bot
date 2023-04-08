defmodule TimeZoneSyncBot.Output.TimeCommandTest do
  use ExUnit.Case, async: true

  test "formats empty list of entries to an output string" do
    expected = "There are no time zones."

    entries = []

    output = TimeZoneSyncBot.Output.TimeCommand.format(entries)

    assert output == expected
  end
end
