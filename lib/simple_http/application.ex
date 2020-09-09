defmodule SimpleHttp.Application do
  @moduledoc false
  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      {Plug.Cowboy, scheme: :http, plug: SimpleHttp.Router, options: [port: port]}
    ]
    opts =
      [
        name: SimpleHttp.Supervisor,
        strategy: :one_for_one
      ]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
