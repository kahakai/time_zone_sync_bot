defmodule TimeZoneSyncBot.Commands.UpdateTimeZoneTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "updates time zone" do
    expected = "<b>Test</b> has been updated with Asia/Jerusalem."

    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")
    {:ok, message} = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Asia/Jerusalem")

    assert message == expected
  end

  test "updates a batch of time zones" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "America/Los_Angeles")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Europe/Warsaw")
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "San_Francisco", "Asia/Jerusalem")

    result = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Warsaw", "Europe/Warsaw")

    assert match?({:ok, _}, result)

    result = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Haifa", "Asia/Jerusalem")

    assert match?({:ok, _}, result)

    result =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "San_Francisco", "America/Los_Angeles")

    assert match?({:ok, _}, result)
  end

  test "fails to update a time zone when the chat ID is not found" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(0, "Test", "Asia/Jerusalem")

    assert error_text == expected
  end

  test "fails to update a time zone when the label is not found" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Asia/Jerusalem")

    assert error_text == expected
  end

  test "fails to update a time zone when the label is blank" do
    expected = """
    Errors occured:
    label not found
    """

    {:error, error_text} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "", "Asia/Jerusalem")

    assert error_text == expected
  end

  test "fails to update a time zone when the location is blank" do
    expected = """
    Errors occured:
    location can't be blank
    """

    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    {:error, error_text} = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "")

    assert error_text == expected
  end

  test "fails to update a time zone when the location is not a valid time zone" do
    expected = """
    Errors occured:
    location is not a valid time zone
    """

    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    {:error, error_text} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Invalid Time Zone")

    assert error_text == expected
  end
end
