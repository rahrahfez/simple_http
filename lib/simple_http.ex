defmodule SimpleHttp do
  require Logger
<<<<<<< HEAD
  @moduledoc """
  Documentation for `SimpleHttp`.
  update dev
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
=======

  def start_link(port: port) do
    {:ok, socket} =
      :gen_tcp.listen(port, [active: false, packet: :http_bin, reuseaddr: true])
    Logger.info("Accepting connections on port #{port}")

    {:ok, spawn_link(SimpleHttp, :accept, [socket])}
  end

  def accept(socket) do
    {:ok, request} = :gen_tcp.accept(socket)

    spawn(fn ->
      body = "Hello world! The time is #{Time.to_string(Time.utc_now())}"

      response = """
      HTTP/1.1 200\r
      Content-Type: text/html\r
      Content-Length: #{byte_size(body)}\r
      \r
      #{body}
      """

      send_response(request, response)
    end)

    accept(socket)
  end

  def send_response(socket, response) do
    :gen_tcp.send(socket, response)
    :gen_tcp.close(socket)
  end

  def child_spec(opts) do
    %{id: SimpleHttp, start: {SimpleHttp, :start_link, [opts]}}
  end

  def hello do
    :world
>>>>>>> 777d0ce1c0c7ab9db158d470f224875bc8f1844a
  end
end
