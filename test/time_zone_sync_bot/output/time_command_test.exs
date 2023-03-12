defmodule TimeZoneSyncBot.Output.TimeCommandTest do
  use ExUnit.Case, async: true

  test "formats empty time zones to an output string" do
    expected = "There are no time zones."

    time_zones = []

    output = TimeZoneSyncBot.Output.TimeCommand.format(time_zones)

    assert output == expected
  end
end
