defmodule TimeZoneSyncBot.Output.ErrorTest do
  use ExUnit.Case, async: true

  test "formats error messages to an output string" do
    error_messages = %{
      label: ["can't be blank"],
      location: ["can't be blank"]
    }

    error_output = TimeZoneSyncBot.Output.Error.format(error_messages)

    assert error_output == """
           Errors occured:
           label can't be blank
           location can't be blank
           """
  end
end
