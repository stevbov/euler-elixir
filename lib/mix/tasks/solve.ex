defmodule Mix.Tasks.Solve do
  use Mix.Task

  def run([]) do
    IO.puts("Usage: mix solve <problem #> [problem #] [problem #] ...")
  end

  def run(["all"]) do
    Euler.Problem.all_problems()
    |> Enum.each(&solve/1)
  end

  def run(args) do
    args
    |> Enum.map(&Euler.Problem.to_module/1)
    |> Enum.each(&solve/1)
  end

  defp solve({:error, message}) do
    IO.puts(message)
  end

  defp solve({:ok, module}) do
    solve(module)
  end

  defp solve(module) do
    problem_number = Euler.Problem.to_problem_number(module)
    name = module.name()

    IO.puts("Solving problem #{problem_number} - #{name}")

    {microseconds, answer} = :timer.tc(module, :solve, [])

    solve_time =
      cond do
        microseconds > 1_000_000 -> "#{microseconds / 1_000_000}s"
        microseconds > 1_000 -> "#{microseconds / 1_000}ms"
        true -> "#{microseconds}us"
      end

    IO.puts("  #{answer} (in #{solve_time})")

  end
end
