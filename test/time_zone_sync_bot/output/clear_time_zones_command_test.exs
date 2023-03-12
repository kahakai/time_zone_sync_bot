defmodule TimeZoneSyncBot.Output.ClearTimeZonesCommandTest do
  use ExUnit.Case, async: true

  test "formats output string" do
    expected = "All time zones have been removed."

    output = TimeZoneSyncBot.Output.ClearTimeZonesCommand.format()

    assert output == expected
  end
end
