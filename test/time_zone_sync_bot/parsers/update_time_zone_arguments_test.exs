defmodule TimeZoneSyncBot.Parsers.UpdateTimeZoneArgumentsTest do
  use ExUnit.Case, async: true

  test "parse empty string" do
    args = ""

    expected = {"", ""}

    actual = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with label only" do
    args = "Test"

    expected = {"Test", ""}

    actual = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with new location only" do
    args = "Etc/UTC"

    expected = {"", "Etc/UTC"}

    actual = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with label and new location" do
    args = "Test Etc/UTC"

    expected = {"Test", "Etc/UTC"}

    actual = TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments.parse(args)

    assert actual == expected
  end
end
