defmodule Resources.NIF do
  use Rustler, otp_app: :resources, crate: :resources_nif

  @spec new() :: {:ok, reference()}
  def new, do: :erlang.nif_error(:nif_not_loaded)

  @spec get(reference()) :: {:ok, String.t()} | {:error, term()}
  def get(_ref), do: :erlang.nif_error(:nif_not_loaded)

  @spec set(reference(), String.t()) :: :ok | {:error, term()}
  def set(_ref, _string), do: :erlang.nif_error(:nif_not_loaded)
end
