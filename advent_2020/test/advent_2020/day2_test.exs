defmodule Advent2020.Day2Test do
  alias Advent2020.Day2
  alias Advent2020.Day2.Entry

  use ExUnit.Case

  describe "count_valid_passwords" do
    test "counts the valid passwords in the given lines" do
      lines = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
      assert Day2.count_valid_passwords(lines, &Entry.min_max_valid?/1) == 2
    end
  end
end
