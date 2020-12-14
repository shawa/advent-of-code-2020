defmodule Advent2020.Day4 do
  alias Advent2020.Day4.Passport

  @field_delimiter ~r/[ \n]/

  def parse_field(<<key::binary-size(3), ":", value::binary>>) do
    {Passport.to_key(key), value}
  end

  def parse_row(str) do
    str
    |> String.split(@field_delimiter)
    |> Enum.reject(&(&1 == ""))
    |> IO.inspect()
    |> Enum.reduce(%Passport{}, fn field, acc ->
      {key, val} = parse_field(field)

      Map.put(acc, key, val)
    end)
  end
end
