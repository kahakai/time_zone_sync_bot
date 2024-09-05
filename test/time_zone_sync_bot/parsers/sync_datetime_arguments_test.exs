defmodule TimeZoneSyncBot.Parsers.SyncDateTimeArgumentsTest do
  use ExUnit.Case, async: true

  test "parse empty string" do
    args = ""

    expected = """
    Errors occured:
    label can't be blank
    time can't be blank
    """

    {:error, error_text} = TimeZoneSyncBot.Parsers.SyncDateTimeArguments.parse(args)

    assert error_text == expected
  end

  test "parse string with label or time only" do
    args = "Test"

    expected = """
    Errors occured:
    label can't be blank
    time can't be blank
    """

    {:error, error_text} = TimeZoneSyncBot.Parsers.SyncDateTimeArguments.parse(args)

    assert error_text == expected
  end

  test "parse string with label and time" do
    args = "Test 12:45:00"

    {:ok, {label, time}} = TimeZoneSyncBot.Parsers.AddTimeZoneArguments.parse(args)

    assert ~T[12:45:00] == time
  end
end
