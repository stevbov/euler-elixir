defmodule Mix.Tasks.Solve do
  use Mix.Task

  def run([]) do
    IO.puts("Usage: mix solve <problem #> [problem #] [problem #] ...")
  end

  def run(args) do
    args
    |> Enum.map(&find_module/1)
    |> Enum.each(&solve/1)
  end

  defp find_module(problem_number) do
    module = String.to_atom("Elixir.Euler.Problem#{String.pad_leading(problem_number, 3, "0")}")
    cond do
      !match?({_, ""}, Integer.parse(problem_number)) ->
        {:error, "#{problem_number} is not a number"}
      match?({:error, _}, Code.ensure_loaded(module)) ->
        {:error, "No solution for problem ##{problem_number}"}
      !Enum.member?(module.module_info(:attributes), {:behaviour, [Euler.Problem]}) ->
        {:error, "No solution for problem ##{problem_number}"}
      true ->
        {:ok, problem_number, module}
    end
  end

  defp solve({:error, message}) do
    IO.puts(message)
  end

  defp solve({:ok, problem_number, module}) do
    name = module.name()
    IO.puts("Solving problem #{problem_number} - #{name}")

    {microseconds, answer} = :timer.tc(module, :solve, [])
    solve_time = cond do
      microseconds > 1_000_000 -> "#{microseconds / 1_000_000}s"
      microseconds > 1_000 -> "#{microseconds / 1_000}ms"
      true -> "#{microseconds}us"
    end
    IO.puts("  #{answer} (in #{solve_time})")
  end
end
