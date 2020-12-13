defmodule Mix.Tasks.Advent2020.Day2 do
  use Mix.Task

  alias Advent2020.Day2
  alias Advent2020.Day2.Entry

  defp read_lines(filename, drop_empty: true) do
    filename
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
  end

  defp database, do: read_lines("input/day2/part1.txt", drop_empty: true)
  defp part(1), do: Day2.count_valid_passwords(database(), &Entry.min_max_valid?/1)
  defp part(2), do: Day2.count_valid_passwords(database(), &Entry.one_hot_valid?/1)

  @impl Mix.Task
  def run(_) do
    IO.puts([
      "Part 1: #{part(1)} valid passwords.",
      "\n",
      "Part 2: #{part(2)} valid passwords."
    ])
  end
end
