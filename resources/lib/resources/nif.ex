defmodule Resources.NIF do
  use Rustler, otp_app: :resources, crate: :resources_nif

  @spec new() :: reference()
  def new, do: :erlang.nif_error(:nif_not_loaded)

  @spec get(reference()) :: String.t()
  def get(_ref), do: :erlang.nif_error(:nif_not_loaded)

  @spec set(reference(), String.t()) :: :ok
  def set(_ref, _string), do: :erlang.nif_error(:nif_not_loaded)
end
