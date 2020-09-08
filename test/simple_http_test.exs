defmodule SimpleHttpTest do
  use ExUnit.Case
  doctest SimpleHttp

  test "greets the world" do
    assert SimpleHttp.hello() == :world
  end

  test "should be on branch dev" do
    assert SimpleHttp.branch() == :dev
  end
end
