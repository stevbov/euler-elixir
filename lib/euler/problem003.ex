defmodule Euler.Problem003 do
  @moduledoc """
  https://projecteuler.net/problem=3

  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?
  """
  @behaviour Euler.Problem

  def name(), do: "Largest prime factor"

  def description(), do: @moduledoc

  def solve() do
    num = 600_851_475_143

    floor(:math.sqrt(num))..1
    |> Stream.filter(fn div -> rem(num, div) == 0 end)
    |> Stream.filter(&Euler.prime?/1)
    |> Enum.take(1)
    |> Enum.fetch!(0)
  end
 end
