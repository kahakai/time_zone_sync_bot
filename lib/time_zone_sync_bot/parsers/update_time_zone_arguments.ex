defmodule TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments do
  def parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label, new_location]) do
    {label, new_location}
  end

  defp normalize([arg]) do
    if String.contains?(arg, "/") do
      {"", arg}
    else
      {arg, ""}
    end
  end

  defp normalize([]) do
    {"", ""}
  end
end
