defmodule TimeZoneSyncBot.Output.Error do
  @errors_occured "Errors occured"

  def create_error_output(error_messages) do
    errors_message = Enum.reduce(error_messages, "", fn {key, value}, acc ->
      acc <> "#{key} #{value}\n"
    end)

    "#{@errors_occured}:\n" <> errors_message
  end
end

