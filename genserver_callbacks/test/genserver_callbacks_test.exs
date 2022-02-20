defmodule GenserverCallbacksTest do
  use ExUnit.Case
  doctest GenserverCallbacks

  test "greets the world" do
    assert GenserverCallbacks.hello() == :world
  end
end
