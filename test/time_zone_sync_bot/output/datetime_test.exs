defmodule TimeZoneSyncBot.Output.DateTimeTest do
  use ExUnit.Case, async: true

  test "formats received datetime into a string" do
    datetime = DateTime.new!(~D[2016-05-24], ~T[13:26:08.003], "Etc/UTC")

    assert TimeZoneSyncBot.Output.Time.strftime(datetime) == "2016-05-24 13:26 (+0000)"

    datetime = DateTime.new!(~D[2016-05-24], ~T[13:26:08.003], "Asia/Tel_Aviv")

    assert TimeZoneSyncBot.Output.Time.strftime(datetime) == "2016-05-24 13:26 (+0300)"
  end
end
