defmodule TimeZoneSyncBot.Output.UpdateTimeZoneCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.TimeZone

  test "formats time zone to an output string" do
    expected = "<b>Haifa</b> has been updated with Asia/Tel_Aviv."

    updated_time_zone = %TimeZone{chat_id: 1, label: "Haifa", location: "Asia/Tel_Aviv"}

    output = TimeZoneSyncBot.Output.UpdateTimeZoneCommand.format(updated_time_zone)

    assert output == expected
  end
end
