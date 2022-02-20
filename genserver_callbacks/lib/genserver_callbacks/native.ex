defmodule GenServerCallbacks.Native do
  use Rustler, otp_app: :genserver_callbacks, crate: :genservercallbacks_native

  def new, do: :erlang.nif_error(:nif_not_laoded)
  def get(_ref), do: :erlang.nif_error(:nif_not_loaded)
  def set(_ref, _string), do: :erlang.nif_error(:nif_not_loaded)
end
