defmodule Euler.Problem006 do
  @moduledoc """
  https://projecteuler.net/problem=6

  The sum of the squares of the first ten natural numbers is,
    1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
    (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is
    3025 - 385 = 2640

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  """
  @behaviour Euler.Problem

  def name(), do: "Sum square difference"
  def description(), do: @moduledoc

  def solve() do
    solve(100)
  end

  def solve(upto) do
    squared_sum(upto) - sum_squares(upto)
  end

  defp sum_squares(upto) do
    1..upto
    |> Stream.map(fn n -> n * n end)
    |> Enum.reduce(0, &+/2)
  end

  defp squared_sum(upto) do
    sum = upto * (upto + 1) / 2
    sum * sum
  end
end
