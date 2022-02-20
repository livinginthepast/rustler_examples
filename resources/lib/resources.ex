defmodule Resources do
  @moduledoc """
  Documentation for `Resources` example.
  """

  @spec new() :: reference()
  def new, do: Resources.NIF.new()

  @spec get(reference()) :: String.t()
  def get(ref), do: Resources.NIF.get(ref)

  @spec set(reference(), String.t()) :: :ok
  def set(ref, string), do: Resources.NIF.set(ref, string)
end
