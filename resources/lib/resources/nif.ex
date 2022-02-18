defmodule Resources.NIF do
  use Rustler, otp_app: :resources, crate: :resources_nif

  def new, do: :erlang.nif_error(:nif_not_loaded)
  def get(_ref), do: :erlang.nif_error(:nif_not_loaded)
  def set(_ref, _string), do: :erlang.nif_error(:nif_not_loaded)
end
