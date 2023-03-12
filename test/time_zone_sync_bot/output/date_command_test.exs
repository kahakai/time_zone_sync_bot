defmodule TimeZoneSyncBot.Output.DateCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.TimeZone

  test "formats empty time zones to an output string" do
    expected = "There are no time zones."

    time_zones = []

    output = TimeZoneSyncBot.Output.DateCommand.format(time_zones)

    assert output == expected
  end
end
