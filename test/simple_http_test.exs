defmodule SimpleHttpTest do
  use ExUnit.Case
  doctest SimpleHttp

  test "should returns :world" do
    assert SimpleHttp.hello() == :world
  end
end
