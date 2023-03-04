defmodule TimeZoneSyncBot.Parsers.RemoveTimeZoneArgumentsTest do
  use ExUnit.Case, async: true

  test "parse empty string" do
    args = ""

    expected = {""}

    actual = TimeZoneSyncBot.Parsers.RemoveTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with label" do
    args = "Test"

    expected = {"Test"}

    actual = TimeZoneSyncBot.Parsers.RemoveTimeZoneArguments.parse(args)

    assert actual == expected
  end
end
