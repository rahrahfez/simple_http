defmodule SimpleHttp.MockRepo do
  alias Ecto.Changeset
  alias SimpleHttp.Node

  def all(Node, _opts \\ []) do
    [
      %Node{
        name: "root",
        list: [1, 3, 5],
        root_id: 0
      },
      %Node{
        name: "child1",
        list: [2, 8, 4, 5, 2],
        root_id: 1
      },
      %Node{
        name: "child2",
        list: [10, 3923, 599],
        root_id: 1
      }
    ]
  end

  def insert(changeset, opts \\ [])

  def insert(%Changeset{errors: [], changes: values}, _opts) do
    {:ok, struct(Node, values)}
  end

  def insert(changeset, _opts) do
    {:error, changeset}
  end

  def get!(Node, id) do
    Enum.find(Node, fn node -> node.id == id end)
  end

  def delete(Node) do
    
  end
end
