defmodule TimeZoneSyncBot.Parsers.AddTimeZoneArguments do
  def parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label, time_zone]) do
    {label, time_zone}
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
