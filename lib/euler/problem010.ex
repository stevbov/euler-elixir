defmodule Euler.Problem010 do
  @moduledoc """
  https://projecteuler.net/problem=10

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """
  @behaviour Euler.Problem

  def name(), do: "Special Pythagorean triplet"
  def description(), do: @moduledoc

  def solve() do
    solve(2_000_000)
  end

  def solve(below) do
    Euler.primes()
    |> Stream.take_while(fn n -> n < below end)
    |> Enum.reduce(0, &+/2)
  end
end
