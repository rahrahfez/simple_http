defmodule Root do
  require Logger
  alias SimpleHttp.Node

  @repo Application.get_env(:simple_http, :repo)

  def insert_node(params) do
    %Node{}
    |> Node.changeset(params)
    |> @repo.insert()
  end

  def all_nodes do
    @repo.all(Node)
  end

  def delete_node(id) do
    node = @repo.get!(Node, id)
    case @repo.delete(node) do
      {:ok, _struct} -> Logger.info "Node #{id} successfully deleted."
      {:error, _changeset} -> Logger.info "Node not found."
    end
  end
end
