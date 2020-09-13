defmodule Euler.Problem005 do
  @moduledoc """
  https://projecteuler.net/problem=5

  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """
  @behaviour Euler.Problem

  def name(), do: "Smallest multiple"
  def description(), do: @moduledoc

  def solve() do
    solve(20)
  end

  def solve(upto) do
    test_nums = test_numbers(upto)

    Stream.iterate(upto, &(&1 + upto))
    |> Enum.find(fn n -> dividable_by_all?(n, test_nums) end)
  end

  defp test_numbers(upto) do
    upto..1
    |> Enum.reduce([], fn x, acc ->
      if Enum.any?(acc, &(rem(&1, x) == 0)) do
        acc
      else
        [x | acc]
      end
    end)
  end

  defp dividable_by_all?(n, nums) do
    Enum.all?(nums, &(rem(n, &1) == 0))
  end
 end
