defmodule Advent2020.Day4Test do
  alias Advent2020.Day4
  alias Advent2020.Day4.Passport

  use ExUnit.Case

  describe "parse_field/1" do
    test "parses field specs correctly" do
      assert Day4.parse_field("ecl:gry") == {:ecl, "gry"}
    end
  end

  describe "parse_row/1" do
    test "parses a row into a passport" do
      first = """
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm
      """

      assert %Passport{
               ecl: "gry",
               pid: "860033327",
               eyr: "2020",
               hcl: "#fffffd",
               byr: "1937",
               iyr: "2017",
               cid: "147",
               hgt: "183cm"
             } == Day4.parse_row(first)
    end
  end
end
