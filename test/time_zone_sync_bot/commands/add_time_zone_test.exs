defmodule TimeZoneSyncBot.Commands.AddTimeZoneTest do
  use TimeZoneSyncBot.RepoCase, async: true

  test "adds UTC time zone" do
    {:ok, message} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Etc/UTC")

    assert message == "Test: Etc/UTC has been added."
  end

  test "adds non-UTC time zone" do
    {:ok, message} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Asia/Jerusalem")

    assert message == "Haifa: Asia/Jerusalem has been added."
  end

  test "fails to add non-canonical time zone" do
    errors = %{
      location: ["is not a valid time zone"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Tel_Aviv", "Asia/Tel_Aviv")

    assert error_messages == errors
  end

  test "adds a batch of time zones" do
    assert match?(
             {:ok, _},
             TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Warsaw", "Europe/Warsaw")
           )

    assert match?(
             {:ok, _},
             TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Haifa", "Asia/Jerusalem")
           )

    assert match?(
             {:ok, _},
             TimeZoneSyncBot.Commands.AddTimeZone.execute(
               1,
               "San_Francisco",
               "America/Los_Angeles"
             )
           )
  end

  test "fails to add a time zone when the label is blank" do
    errors = %{
      label: ["can't be blank"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "", "Asia/Jerusalem")

    assert error_messages == errors
  end

  test "fails to add a time zone when the location is blank" do
    errors = %{
      location: ["can't be blank"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Asia/Jerusalem", "")

    assert error_messages == errors
  end

  test "fails to add a time zone when the location is not a valid time zone" do
    errors = %{
      location: ["is not a valid time zone"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Invalid Time Zone")

    assert error_messages == errors
  end

  test "fails to add a time zone when the label has already been taken" do
    {:ok, _} = TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Asia/Jerusalem")

    errors = %{
      label: ["has already been taken"]
    }

    {:error, error_messages} =
      TimeZoneSyncBot.Commands.AddTimeZone.execute(1, "Test", "Europe/Warsaw")

    assert error_messages == errors
  end
end
