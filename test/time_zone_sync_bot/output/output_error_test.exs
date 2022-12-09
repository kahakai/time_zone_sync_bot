defmodule TimeZoneSyncBot.Output.ErrorTest do
  use ExUnit.Case, async: true

  test "creates a formatted string of error messages" do
    error_messages = %{
      label: ["can't be blank"],
      location: ["can't be blank"]
    }

    error_output = TimeZoneSyncBot.Output.Error.create_error_output(error_messages)

    assert error_output == """
                           Errors occured:
                           label can't be blank
                           location can't be blank
                           """
  end
end

