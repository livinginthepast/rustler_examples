defmodule GenServerCallbacks do
  @moduledoc """
  Documentation for `GenServerCallbacks`.
  """
  use GenServer

  @spec start_link(term()) :: {:ok, pid()}
  def start_link(args \\ []), do: GenServer.start_link(__MODULE__, args)

  @spec get(pid()) :: {:ok, String.t()} | {:error, term()}
  def get(pid), do: GenServer.call(pid, :get)

  @spec set(pid(), String.t()) :: :ok | {:error, term()}
  def set(pid, value), do: GenServer.call(pid, {:set, value})

  def init(_args) do
    {:ok, ref} = GenServerCallbacks.Native.new()
    {:ok, %{ref: ref, caller: nil}}
  end

  def handle_call(:get, from, state) do
    :ok = GenServerCallbacks.Native.get(state.ref)
    {:noreply, %{state | caller: from}}
  end

  def handle_call({:set, value}, _from, state) do
    {:reply, GenServerCallbacks.Native.set(state.ref, value), state}
  end

  def handle_info({:current_value, value}, state) do
    GenServer.reply(state.caller, {:ok, value})
    {:noreply, %{state | caller: nil}}
  end
end
