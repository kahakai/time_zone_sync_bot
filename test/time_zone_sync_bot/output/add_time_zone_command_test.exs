defmodule TimeZoneSyncBot.Output.AddTimeZoneCommandTest do
  use ExUnit.Case, async: true

  alias TimeZoneSyncBot.Entry

  test "formats time zone to an output string" do
    expected = "<b>Haifa</b>: Asia/Tel_Aviv has been added."

    inserted_entry = %Entry{chat_id: 1, label: "Haifa", time_zone: "Asia/Tel_Aviv"}

    output = TimeZoneSyncBot.Output.AddTimeZoneCommand.format(inserted_entry)

    assert output == expected
  end
end
