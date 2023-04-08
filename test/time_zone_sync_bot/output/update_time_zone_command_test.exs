defmodule TimeZoneSyncBot.Output.UpdateTimeZoneCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.Entry

  test "formats time zone to an output string" do
    expected = "<b>Haifa</b> has been updated with Asia/Tel_Aviv."

    updated_entry = %Entry{chat_id: 1, label: "Haifa", time_zone: "Asia/Tel_Aviv"}

    output = TimeZoneSyncBot.Output.UpdateTimeZoneCommand.format(updated_entry)

    assert output == expected
  end
end
