defmodule EulerTest do
  use ExUnit.Case

  test "problem 1" do
    assert Euler.problem1() == 233_168
  end

  test "problem 2" do
    assert Euler.problem2() == 4_613_732
  end

  test "problem 3" do
    assert Euler.problem3() == 6857
  end

  test "problem 4" do
    assert Euler.problem4() == 906_609
  end

  test "integer palindrome" do
    tests = %{
      9 => true,
      91 => false,
      99 => true,
      919 => true,
      912 => false,
      9119 => true,
      9129 => false,
      9112 => false
    }

    Enum.each(tests, fn {num, expected} ->
      assert Euler.integer_palindrome?(num) == expected
    end)
  end
end
