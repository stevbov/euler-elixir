defmodule Euler.Problem009 do
  @moduledoc """
  https://projecteuler.net/problem=9

  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """
  @behaviour Euler.Problem

  def name(), do: "Special Pythagorean triplet"
  def description(), do: @moduledoc

  def solve() do
    n = 1000

    for c <- n..3,
        b <- (c - 1)..2,
        a <- (b - 1)..1,
        a + b + c == n,
        a * a + b * b == c * c do
      a * b * c
    end
    |> hd()
  end
end
