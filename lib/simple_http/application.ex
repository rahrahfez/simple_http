defmodule SimpleHttp.Application do
  @moduledoc false
  use Application

<<<<<<< HEAD
  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      {SimpleHttp.PlugAdapter, plug: CurrentTime, options: [port: port]}
    ]
    opts =
      [
        name: SimpleHttp.Supervisor,
        strategy: :one_for_one
      ]
=======
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4040")
    IO.puts(port)
    children = [
      {SimpleHttp, port}
    ]
    opts = [
      strategy: :one_for_one,
      name: SimpleHttp.Supervisor
    ]
>>>>>>> 777d0ce1c0c7ab9db158d470f224875bc8f1844a

    Supervisor.start_link(children, opts)
  end
end
