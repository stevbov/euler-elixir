defmodule Euler do
  def fib do
    Stream.unfold({0, 1}, fn {current, next} ->
      {current, {next, current + next}}
    end)
  end

  def prime?(num) when num <= 1, do: false

  def prime?(num) do
    1..floor(:math.sqrt(num))
    |> Stream.filter(fn div -> div != 1 && rem(num, div) == 0 end)
    |> Enum.empty?()
  end

  def primes() do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
  end

  def triangular_numbers() do
    Stream.unfold({1, 2}, fn {current, n} ->
      {current, {current + n, n + 1}}
    end)
  end

  def divisors(1), do: [1]
  def divisors(number) do
    1..ceil(number/2)
    |> Stream.filter(fn div -> rem(number, div) == 0 end)
    |> Enum.to_list()
    |> List.insert_at(0, number)
  end
end
