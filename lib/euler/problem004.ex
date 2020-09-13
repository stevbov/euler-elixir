defmodule Euler.Problem004 do
  @moduledoc """
  https://projecteuler.net/problem=4

  A palindromic number reads the same both ways. The largest palindrome made from
  the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  @behaviour Euler.Problem

  def name(), do: "Largest palindrome product"
  def description(), do: @moduledoc

  def solve() do
    pairs()
    |> Stream.map(fn {x, y} -> x * y end)
    |> Stream.filter(&integer_palindrome?/1)
    |> Enum.max()
  end

  defp pairs do
    for x <- 100..999, y <- x..999 do
      {x, y}
    end
  end

  def integer_palindrome?(int) do
    digits = Integer.digits(int)
    digits == Enum.reverse(digits)
  end
end
