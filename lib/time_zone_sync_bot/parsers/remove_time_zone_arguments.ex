defmodule TimeZoneSyncBot.Parsers.RemoveTimeZoneArguments do
  def parse(args) do
    String.split(args) |> normalize
  end

  defp normalize([label]) do
    {label}
  end

  defp normalize([]) do
    {""}
  end
end
