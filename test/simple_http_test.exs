defmodule SimpleHttpTest do
  use ExUnit.Case, async: true

  alias SimpleHttp.Node

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SimpleHttp.Repo)
  end

  test "should insert new node into repository" do
    node = %{
      root_name: "child3",
      link: [32, 354, 69],
      root_id: 1
    }
    assert {:ok, %Node{}} = Root.insert(node)
  end

  test "should add child node to parent" do

  end

  test "should delete node along with children" do

  end

  test "should update node with new list" do

  end
end
