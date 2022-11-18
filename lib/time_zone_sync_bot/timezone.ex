defmodule TimeZone do
  @enforce_keys [:label, :location]
  defstruct [:label, :location]
end
