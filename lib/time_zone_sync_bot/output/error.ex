defmodule TimeZoneSyncBot.Output.Error do
  @errors_occured "Errors occured"

  def format(error_messages) do
    error_text =
      Enum.reduce(error_messages, "", fn {key, value}, acc ->
        acc <> "#{key} #{value}\n"
      end)

    "#{@errors_occured}:\n" <> error_text
  end
end
