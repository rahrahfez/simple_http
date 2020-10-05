defmodule Root do
  require Logger

  alias SimpleHttp.Node

  @repo Application.get_env(:simple_http, :repo)

  def insert(params) do
    %Node{}
    |> Node.changeset(params)
    |> @repo.insert()
  end
end
