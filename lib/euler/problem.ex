defmodule Euler.Problem do
  @callback name() :: String.t
  @callback description() :: String.t
  @callback solve() :: term
end
