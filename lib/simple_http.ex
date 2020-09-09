defmodule SimpleHttp do
  require Logger
  @moduledoc """
  Documentation for `SimpleHttp`.
  """

  def start_link(port, dispatch) do
    {:ok, socket} =
      :gen_tcp.listen(port, [packet: :http_bin, active: false, reuseaddr: true])
      Logger.info("Accpeting connections on port #{port}")

    {:ok, spawn_link(SimpleHttp, :accept, [socket, dispatch])}
  end

  def accept(socket, dispatch) do
    {:ok, request} = :gen_tcp.accept(socket)

    spawn(fn ->
      dispatch.(request)
    end)

    accept(socket, dispatch)
  end

  def send_response(socket, response) do
    :gen_tcp.send(socket, response)
    :gen_tcp.close(socket)
  end

  def child_spec(opts) do
    %{
      id: SimpleHttp,
      start: {SimpleHttp, :start_link, [opts]}
    }
  end
end
