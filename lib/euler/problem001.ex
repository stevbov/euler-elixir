defmodule Euler.Problem001 do
  @moduledoc """
  https://projecteuler.net/problem=1

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """
  @behaviour Euler.Problem

  def name(), do: "Multiples of 3 and 5"

  def description(), do: @moduledoc

  def solve() do
    1..999
    |> Stream.filter(fn num -> rem(num, 3) == 0 || rem(num, 5) == 0 end)
    |> Enum.reduce(0, &+/2)
  end
 end
