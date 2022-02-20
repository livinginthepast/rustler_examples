defmodule GenServerCallbacksTest do
  use ExUnit.Case
  doctest GenServerCallbacks

  test "greets the world" do
    assert {:ok, pid} = GenServerCallbacks.start_link()
    assert {:ok, "Hello world"} = GenServerCallbacks.get(pid)
  end

  test "Updates state" do
    assert {:ok, pid} = GenServerCallbacks.start_link()
    assert :ok = GenServerCallbacks.set(pid, "Hello moon")
    assert {:ok, "Hello moon"} = GenServerCallbacks.get(pid)
  end
end
