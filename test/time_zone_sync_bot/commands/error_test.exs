defmodule TimeZoneSyncBot.Commands.ErrorTest do
  use ExUnit.Case, async: true

  test "formats a map of one error message to a human-friendly text message" do
    expected_error_messages = %{
      label: ["can't be blank"]
    }

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "",
      time_zone: "Etc/UTC"
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)

    error_text = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)

    assert error_text == expected_error_messages
  end

  test "formats a map of two error messages to a human-friendly text message" do
    expected_error_messages = %{
      label: ["can't be blank"],
      time_zone: ["can't be blank"]
    }

    entry = %TimeZoneSyncBot.Entry{}

    params = %{
      chat_id: 1,
      label: "",
      time_zone: ""
    }

    changeset = TimeZoneSyncBot.Entry.changeset(entry, params)

    error_text = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)

    assert error_text == expected_error_messages
  end
end
