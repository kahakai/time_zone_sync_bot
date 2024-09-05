defmodule TimeZoneSyncBot.Output.SyncDateTimeCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.Entry

  test "formats empty list of labeled datetimes to an output string" do
    expected = "There are no time zones."

    labeled_datetimes = []

    output = TimeZoneSyncBot.Output.SyncDateTimeCommand.format(labeled_datetimes)

    assert output == expected
  end

  test "formats labeled datetimes to an output string" do
    expected = """
    <b>Haifa</b>: 2016-05-24 13:26 (+0300)
    <b>Warsaw</b>: 2016-05-24 12:26 (+0200)
    """

    labeled_datetimes = [
      %{label: "Haifa", datetime: DateTime.new!(~D[2016-05-24], ~T[13:26:00], "Asia/Tel_Aviv")},
      %{label: "Warsaw", datetime: DateTime.new!(~D[2016-05-24], ~T[13:26:00], "Europe/Warsaw")}
    ]

    output = TimeZoneSyncBot.Output.SyncDateTimeCommand.format(labeled_datetimes)

    assert output == expected
  end
end
