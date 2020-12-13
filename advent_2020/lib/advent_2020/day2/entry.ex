defmodule Advent2020.Day2.Entry do
  @enforce_keys [:i, :j, :char, :password]
  defstruct @enforce_keys

  @password_line_re ~r/(?<i>\d+)-(?<j>\d+) (?<char>[a-z]): (?<password>[a-z]+)/

  def to_entry!(%{"i" => i, "j" => j, "char" => char, "password" => password}) do
    %__MODULE__{
      i: String.to_integer(i),
      j: String.to_integer(j),
      char: char,
      password: password
    }
  end

  def from_string!(line) when is_binary(line) do
    @password_line_re
    |> Regex.named_captures(line)
    |> to_entry!()
  end

  defp count(<<x::binary-size(1), rest::binary>>, c, acc) do
    case x do
      ^c ->
        count(rest, c, acc + 1)

      _ ->
        count(rest, c, acc)
    end
  end

  defp count(<<>>, _, acc), do: acc

  def count(bistring, char), do: count(bistring, char, 0)

  def min_max_valid?(%__MODULE__{i: i, j: j, char: char, password: password}) do
    occurences = count(password, char)

    i <= occurences and occurences <= j
  end

  def one_hot_valid?(%__MODULE__{i: i, j: j, char: char, password: password}) do
    case {String.at(password, i - 1), String.at(password, j - 1)} do
      {^char, ^char} ->
        false

      {^char, _} ->
        true

      {_, ^char} ->
        true

      {_, _} ->
        false
    end
  end
end
