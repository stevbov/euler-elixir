defmodule EulerTest do
  use ExUnit.Case

  test "problem 1" do
    assert Euler.Problem001.solve() == 233_168
  end

  test "problem 2" do
    assert Euler.Problem002.solve() == 4_613_732
  end

  test "problem 3" do
    assert Euler.Problem003.solve() == 6857
  end

  test "problem 4" do
    assert Euler.Problem004.solve() == 906_609
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
      assert Euler.Problem004.integer_palindrome?(num) == expected
    end)
  end

  test "problem 5" do
    assert Euler.Problem005.solve(10) == 2520
    assert Euler.Problem005.solve() == 232_792_560
  end

  test "problem 6" do
    assert Euler.Problem006.solve(10) == 2640
    assert Euler.Problem006.solve() == 25_164_150
  end

  test "problem 7" do
    assert Euler.Problem007.solve(6) == 13
    assert Euler.Problem007.solve() == 104_743
  end

  test "problem 8" do
    assert Euler.Problem008.solve(4) == 5832
    assert Euler.Problem008.solve() == 23_514_624_000
  end

  test "problem 9" do
    assert Euler.Problem009.solve() == 31_875_000
  end

  test "problem 10" do
    assert Euler.Problem010.solve(10) == 17
    assert Euler.Problem010.solve() == 142_913_828_922
  end

  test "tringular numbers" do
    assert Euler.triangular_numbers() |> Enum.take(5) == [1, 3, 6, 10, 15]
  end

  test "problem 12" do
    assert Euler.Problem012.solve(5) == 28
  end
end
