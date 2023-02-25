defmodule TimeZoneSyncBot.Commands.ErrorTest do
  use ExUnit.Case, async: true

  test "returns a map of error messages composed in a human friendly way" do
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

    error_messages = TimeZoneSyncBot.Commands.Error.extract_error_messages(changeset)

    assert error_messages == expected_error_messages
  end
end
