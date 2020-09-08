defmodule SimpleHttp.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      {SimpleHttp, port}
    ]
    opts =
      [
        name: SimpleHttp.Supervisor,
        strategy: :one_for_one
      ]

    Supervisor.start_link(children, opts)
  end
end
