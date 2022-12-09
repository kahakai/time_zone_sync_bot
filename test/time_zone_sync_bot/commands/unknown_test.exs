defmodule TimeZoneSyncBot.Commands.UnknownTest do
  use ExUnit.Case, async: true

  test "returns :ok tuple with the message about unknown command" do
    {:ok, message} = TimeZoneSyncBot.Commands.Unknown.execute()

    assert String.starts_with?(message, "Unknown command.")
  end
end
