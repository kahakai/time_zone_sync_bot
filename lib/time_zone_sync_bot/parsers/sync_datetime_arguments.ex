defmodule TimeZoneSyncBot.Parsers.SyncDateTimeArguments do
  def parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label, base_time]) do
    case parse_time(base_time) do
      {:ok, time} ->
        {:ok, {label, time}}

      {:error, _} ->
        {:error, "Could not parse the time."}
    end
  end

  defp normalize([_]) do
    {:error,
     """
     Errors occured:
     label can't be blank
     time can't be blank
     """}
  end

  defp normalize([]) do
    {:error,
     """
     Errors occured:
     label can't be blank
     time can't be blank
     """}
  end

  defp parse_time(string) do
    Time.from_iso8601(string)
  end
end
