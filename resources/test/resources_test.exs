defmodule ResourcesTest do
  use ExUnit.Case

  test "greets the world" do
    assert {:ok, ref} = Resources.new()
    assert {:ok, "Hello world"} = Resources.get(ref)
  end

  test "Updates state" do
    assert {:ok, ref} = Resources.new()
    assert :ok = Resources.set(ref, "Hello moon")
    assert {:ok, "Hello moon"} = Resources.get(ref)
  end
end
