defmodule Euler do
  require Integer
 
  def problem1 do
    1..999
    |> Stream.filter(fn num -> rem(num, 3) == 0 || rem(num, 5) == 0 end)
    |> Enum.reduce(0, &+/2)
  end

  def problem2 do
    fib()
    |> Stream.take_while(fn value -> value < 4_000_000 end)
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.reduce(0, &+/2)
  end

  defp fib do
    Stream.unfold({0, 1}, fn ({current, next}) ->
      {current, {next, current + next}}
    end)
  end

  def problem3 do
    num = 600851475143
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

  def problem4 do
    problem4_pairs()
    |> Stream.map(fn {x, y} -> x * y end)
    |> Stream.filter(&integer_palindrome?/1)
    |> Enum.max
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
end
