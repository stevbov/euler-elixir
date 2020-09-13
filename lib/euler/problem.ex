defmodule Euler.Problem do
  @callback name() :: String.t()
  @callback description() :: String.t()
  @callback solve() :: term

  @doc """
  Gets all problems
  """
  def all_problems() do
    :code.all_available()
    |> Enum.map(fn {module_name, _, _} -> module_name end)
    |> Enum.map(&to_string/1)
    |> Enum.filter(&String.starts_with?(&1, "Elixir.Euler.Problem"))
    |> Enum.map(&String.to_atom/1)
    # need to make sure the code is actually loaded - it won't always be
    |> Enum.map(&Code.ensure_loaded/1)
    |> Enum.map(fn {:module, module} -> module end)
    # make sure the module implements the Euler.Problem behavior
    |> Enum.filter(fn module ->
      Enum.member?(module.module_info(:attributes), {:behaviour, [Euler.Problem]})
    end)
    |> Enum.sort()
  end

  @doc """
  Converts a module to the problem number.
  """
  def to_problem_number(module) do
    module
    |> Atom.to_string()
    |> String.replace(~r/^[^1-9]*/, "")
  end

  @doc """
  Converts a problem number to the module.
  """
  def to_module(problem_number) do
    module = String.to_atom("Elixir.Euler.Problem#{String.pad_leading(problem_number, 3, "0")}")

    cond do
      !match?({_, ""}, Integer.parse(problem_number)) ->
        {:error, "#{problem_number} is not a number"}

      match?({:error, _}, Code.ensure_loaded(module)) ->
        {:error, "No solution for problem ##{problem_number}"}

      !Enum.member?(module.module_info(:attributes), {:behaviour, [Euler.Problem]}) ->
        {:error, "No solution for problem ##{problem_number}"}

      true ->
        {:ok, module}
    end
  end
end
