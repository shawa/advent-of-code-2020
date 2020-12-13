defmodule Advent2020.Day2.EntryTest do
  use ExUnit.Case

  alias Advent2020.Day2.Entry

  describe "min_max_valid?/1" do
    test "verifies that exacyle one of pass[i] or pass[j] is 'char' (1 indexed)" do
      assert Entry.min_max_valid?(%Entry{i: 1, j: 3, char: "a", password: "abcde"})
      refute Entry.min_max_valid?(%Entry{i: 1, j: 3, char: "b", password: "cdefg"})
      assert Entry.min_max_valid?(%Entry{i: 2, j: 9, char: "c", password: "ccccccccc"})
    end
  end

  describe "one_hot_valid?/1" do
    test "verifies that `char` occurs betwen `i` and `j` times in `password`" do
      assert Entry.one_hot_valid?(%Entry{i: 1, j: 3, char: "a", password: "abcde"})
      refute Entry.one_hot_valid?(%Entry{i: 1, j: 3, char: "b", password: "cdefg"})
      refute Entry.one_hot_valid?(%Entry{i: 2, j: 9, char: "c", password: "ccccccccc"})
    end
  end

  describe "count/3" do
    test "counts the occurences of c in the given bitstring" do
      assert Entry.count("apple", "a") == 1
      assert Entry.count("apple", "p") == 2
      assert Entry.count("apple", "x") == 0
    end
  end

  describe "from_string!/1" do
    test "parses a valid entry line into an Entry" do
      assert %Entry{i: 1, j: 2, char: "a", password: "abcde"} ==
               Entry.from_string!("1-2 a: abcde")
    end
  end
end
