defmodule TimeZoneSyncBot.Commands.HelpTest do
  use ExUnit.Case, async: true

  test "returns :ok tuple with the message" do
    {:ok, message} = TimeZoneSyncBot.Commands.Help.execute()

    assert String.starts_with?(message, "Available commands")
  end
end
