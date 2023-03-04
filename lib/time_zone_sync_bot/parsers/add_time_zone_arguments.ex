defmodule TimeZoneSyncBot.Parsers.AddTimeZoneArguments do
  defp parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label, location]) do
    {label, location}
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
