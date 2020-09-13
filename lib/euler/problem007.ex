defmodule Euler.Problem007 do
  @moduledoc """
  https://projecteuler.net/problem=7

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
  that the 6th prime is 13.

  What is the 10,001st prime number?
  """
  @behaviour Euler.Problem

  def name(), do: "10001st prime"
  def description(), do: @moduledoc

  def solve() do
    solve(10001)
  end

  def solve(n) do
    Euler.primes()
    |> Enum.fetch!(n - 1)
  end
end
