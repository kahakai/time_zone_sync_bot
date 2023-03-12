defmodule TimeZoneSyncBot.Output.RemoveTimeZoneCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.TimeZone

  test "formats time zone to an output string" do
    expected = "<b>Haifa</b>: Asia/Tel_Aviv has been removed."

    deleted_time_zone = %TimeZone{chat_id: 1, label: "Haifa", location: "Asia/Tel_Aviv"}

    output = TimeZoneSyncBot.Output.RemoveTimeZoneCommand.format(deleted_time_zone)

    assert output == expected
  end
end
