defmodule Advent2020.Day4.Passport do
  defstruct [
    :byr,
    :iyr,
    :eyr,
    :hgt,
    :hcl,
    :ecl,
    :pid,
    :cid
  ]

  @required [
    :byr,
    :iyr,
    :eyr,
    :hgt,
    :hcl,
    :ecl,
    :pid
  ]

  def to_key("byr"), do: :byr
  def to_key("iyr"), do: :iyr
  def to_key("eyr"), do: :eyr
  def to_key("hgt"), do: :hgt
  def to_key("hcl"), do: :hcl
  def to_key("ecl"), do: :ecl
  def to_key("pid"), do: :pid
  def to_key("cid"), do: :cid

  defp key_set?(map, key) do
    not is_nil(Map.get(map, key))
  end

  def valid?(%__MODULE__{} = passport) do
    Enum.all?(@required, &key_set?(passport, &1))
  end
end
