defmodule SimpleHttp.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {Http, port: 4000}
    ]

    opts = [strategy: :one_for_one, name: SimpleHttp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
