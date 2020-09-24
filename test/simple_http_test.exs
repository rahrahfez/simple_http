defmodule SimpleHttpTest do
  use ExUnit.Case

  alias SimpleHttp.Node

  test "should insert new node into repository" do
    node = %{
      name: "child3",
      link: [32, 354, 69],
      root_id: 1
    }
    assert {:ok, %Node{}} = Root.insert(node)
  end

  test "should return error for invalid node" do
    node = %{
      name: 33,
      link: [],
      root_id: 1
    }
    assert {:error, changeset} = Root.insert(node)
  end
end
