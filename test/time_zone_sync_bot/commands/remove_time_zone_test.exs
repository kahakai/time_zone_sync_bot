defmodule TimeZoneSyncBot.Commands.RemoveTimeZoneTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "removes time zone" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    {:ok, message} = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "Test")

    assert message == "<b>Test</b>: Etc/UTC has been removed."
  end

  test "removes a batch of time zones" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Asia/Jerusalem")

    {:ok, _} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "America/Los_Angeles")

    result = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "Warsaw")

    assert match?({:ok, _}, result)

    result = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "Haifa")

    assert match?({:ok, _}, result)

    result = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "San_Francisco")

    assert match?({:ok, _}, result)
  end

  test "fails to remove a time zone when the chat ID is not found" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(0, "Test")

    assert error_text == expected
  end

  test "fails to remove a time zone when the label is not found" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "Test")

    assert error_text == expected
  end

  test "fails to remove a time zone when the label is blank" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} = TimeZoneSyncBot.Commands.RemoveTimeZone.execute(1, "")

    assert error_text == expected
  end
end
