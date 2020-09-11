defmodule Euler do
  require Integer

  @doc """
  https://projecteuler.net/problem=1

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def problem1 do
    1..999
    |> Stream.filter(fn num -> rem(num, 3) == 0 || rem(num, 5) == 0 end)
    |> Enum.reduce(0, &+/2)
  end

  @doc """
  https://projecteuler.net/problem=2

  Each new term in the Fibonacci sequence is generated by adding the previous two
  terms. By starting with 1 and 2, the first 10 terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed
  four million, find the sum of the even-valued terms.
  """
  def problem2 do
    fib()
    |> Stream.take_while(fn value -> value < 4_000_000 end)
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.reduce(0, &+/2)
  end

  defp fib do
    Stream.unfold({0, 1}, fn {current, next} ->
      {current, {next, current + next}}
    end)
  end

  @doc """
  https://projecteuler.net/problem=3

  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?
  """
  def problem3 do
    num = 600_851_475_143

    floor(:math.sqrt(num))..1
    |> Stream.filter(fn div -> rem(num, div) == 0 end)
    |> Stream.filter(&prime?/1)
    |> Enum.take(1)
    |> Enum.fetch!(0)
  end

  defp prime?(num) when num <= 1, do: false

  defp prime?(num) do
    1..floor(:math.sqrt(num))
    |> Stream.filter(fn div -> div != 1 && rem(num, div) == 0 end)
    |> Enum.empty?()
  end

  @doc """
  https://projecteuler.net/problem=4

  A palindromic number reads the same both ways. The largest palindrome made from
  the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  def problem4 do
    problem4_pairs()
    |> Stream.map(fn {x, y} -> x * y end)
    |> Stream.filter(&integer_palindrome?/1)
    |> Enum.max()
  end

  def problem4_pairs do
    for x <- 100..999, y <- x..999 do
      {x, y}
    end
  end

  def integer_palindrome?(int) do
    digits = Integer.digits(int)
    digits == Enum.reverse(digits)
  end

  @doc """
  https://projecteuler.net/problem=5

  2520 is the smallest number that can be divided by each of the numbers from 1
  to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """
  def problem5(upto) do
    test_nums = problem5_test_numbers(upto)

    Stream.iterate(upto, &(&1 + upto))
    |> Enum.find(fn n -> dividable_by_all?(n, test_nums) end)
  end

  defp problem5_test_numbers(upto) do
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

  @doc """
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
  def problem6(upto) do
    problem6_squared_sum(upto) - problem6_sum_squares(upto)
  end

  defp problem6_sum_squares(upto) do
    1..upto
    |> Stream.map(fn n -> n * n end)
    |> Enum.reduce(0, &+/2)
  end

  defp problem6_squared_sum(upto) do
    sum = upto * (upto + 1) / 2
    sum * sum
  end
end
