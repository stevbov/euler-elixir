defmodule Euler do
  def problem1 do
    1..999
    |> Stream.filter(fn num -> rem(num, 3) == 0 || rem(num, 5) == 0 end)
    |> Enum.reduce(0, &+/2)
  end
end
