defmodule GenServerCallbacks do
  @moduledoc """
  Documentation for `GenServerCallbacks`.
  """
  use GenServer

  def start_link(args \\ []), do: GenServer.start_link(__MODULE__, args)
  def get(pid), do: GenServer.call(pid, :get)
  def set(pid, value), do: GenServer.call(pid, {:set, value})

  def init(_args) do
    {:ok, ref} = GenServerCallbacks.Native.new()
    {:ok, %{ref: ref, caller: nil}}
  end

  def handle_call(:get, from, state) do
    {:ok, :ok} = GenServerCallbacks.Native.get(state.ref)
    {:noreply, %{state | caller: from}}
  end

  def handle_call({:set, value}, _from, state) do
    {:ok, :ok} = GenServerCallbacks.Native.set(state.ref, value)
    {:reply, :ok, state}
  end

  def handle_info({:current_value, value}, state) do
    GenServer.reply(state.caller, value)
    {:noreply, %{state | caller: nil}}
  end
end
