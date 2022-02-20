defmodule Resources do
  @moduledoc """
  Documentation for `Resources` example.
  """

  @spec new() :: {:ok, reference()}
  def new, do: Resources.NIF.new()

  @spec get(reference()) :: {:ok, String.t()} | {:error, term()}
  def get(ref), do: Resources.NIF.get(ref)

  @spec set(reference(), String.t()) :: :ok | {:error, term()}
  def set(ref, string), do: Resources.NIF.set(ref, string)
end
