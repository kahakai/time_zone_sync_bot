defmodule TimeZoneSyncBot.Output.DateTest do
  use ExUnit.Case, async: true

  test "formats received datetime into a string" do
    datetime = DateTime.new!(~D[2016-05-24], ~T[13:26:08.003], "Etc/UTC")

    assert TimeZoneSyncBot.Output.Date.strftime(datetime) == "2016-05-24"

    datetime = DateTime.new!(~D[2016-05-24], ~T[13:26:08.003], "Asia/Tel_Aviv")

    assert TimeZoneSyncBot.Output.Date.strftime(datetime) == "2016-05-24"
  end
end
