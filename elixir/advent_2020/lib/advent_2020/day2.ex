defmodule Advent2020.Day2 do
  alias Advent2020.Day2.Entry

  def count_valid_passwords(lines, validator) do
    Enum.count(lines, fn line ->
      line
      |> Entry.from_string!()
      |> validator.()
    end)
  end
end
