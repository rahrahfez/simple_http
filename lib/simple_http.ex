defmodule SimpleHttp do
  require Logger
  @moduledoc """
  Documentation for `SimpleHttp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SimpleHttp.hello()
      :world

  """
  def hello do
    :world
  end

  def branch do
    :dev
  end

  def start_link(port: port) do
    {:ok, socket} =
      :gen_tcp.listen(port, [packet: :http_bin, active: false, reuseaddr: true])
      Logger.info("Accpeting connections on port #{port}")

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

      send_request(request, response)
    end)

    accept(socket)
  end

  def send_request(socket, response) do
    :gen_tcp.send(socket, response)
    :gen_tcp.close(socket)
  end

  def child_spec(opts) do
    %{id: SimpleHttp, start: {SimpleHttp, :start_link, [opts]}}
  end
end
