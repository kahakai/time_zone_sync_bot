defmodule TimeZoneSyncBot.Commands.UpdateTimeZoneTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "updates time zone" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    {:ok, message} = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Asia/Jerusalem")

    assert message == "Test has been updated with Asia/Jerusalem."
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
    errors = %{
      label: ["not found"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(0, "Test", "Asia/Jerusalem")

    assert error_messages == errors
  end

  test "fails to update a time zone when the label is not found" do
    errors = %{
      label: ["not found"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Asia/Jerusalem")

    assert error_messages == errors
  end

  test "fails to update a time zone when the label is blank" do
    errors = %{
      label: ["not found"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "", "Asia/Jerusalem")

    assert error_messages == errors
  end

  test "fails to update a time zone when the location is blank" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    errors = %{
      location: ["can't be blank"]
    }

    {:error, error_messages} = TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "")

    assert error_messages == errors
  end

  test "fails to update a time zone when the location is not a valid time zone" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    errors = %{
      location: ["is not a valid time zone"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.UpdateTimeZone.execute(1, "Test", "Invalid Time Zone")

    assert error_messages == errors
  end
end