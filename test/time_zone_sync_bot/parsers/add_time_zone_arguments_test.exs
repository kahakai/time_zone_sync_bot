defmodule TimeZoneSyncBot.Parsers.AddTimeZoneArgumentsTest do
  use ExUnit.Case, async: true

  test "parse empty string" do
    args = ""

    expected = {"", ""}

    actual = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with label only" do
    args = "Test"

    expected = {"Test", ""}

    actual = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with location only" do
    args = "Etc/UTC"

    expected = {"", "Etc/UTC"}

    actual = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    assert actual == expected
  end

  test "parse string with label and location" do
    args = "Test Etc/UTC"

    expected = {"Test", "Etc/UTC"}

    actual = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    assert actual == expected
  end
end
