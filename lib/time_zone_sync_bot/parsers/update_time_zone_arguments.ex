defmodule TimeZoneSyncBot.Parsers.UpdateTimeZoneArguments do
  def parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label, new_time_zone]) do
    {label, new_time_zone}
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
