defmodule TimeZoneSyncBot.Commands.ErrorTest do
  use ExUnit.Case, async: true

  test "formats a map of one error message to a human-friendly text message" do
    expected_error_messages = %{
      label: ["can't be blank"]
    }

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "",
      location: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)

    error_text = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)

    assert error_text == expected_error_messages
  end

  test "formats a map of two error messages to a human-friendly text message" do
    expected_error_messages = %{
      label: ["can't be blank"],
      location: ["can't be blank"]
    }

    time_zone = %TimeZoneSyncBot.TimeZone{}

    params = %{
      chat_id: 1,
      label: "",
      location: ""
    }

    changeset = TimeZoneSyncBot.TimeZone.changeset(time_zone, params)

    error_text = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)

    assert error_text == expected_error_messages
  end
end
