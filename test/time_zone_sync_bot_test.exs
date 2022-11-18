defmodule TimeZoneSyncBotTest do
  use ExUnit.Case
  doctest TimeZoneSyncBot

  test "greets the world" do
    assert TimeZoneSyncBot.hello() == :world
  end
end
