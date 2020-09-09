defmodule SimpleHttp.PlugAdapter do
  def dispatch(request, plug) do
    %Plug.Conn{
      adapter: {SimpleHttp.PlugAdapter, request},
      owner: self()
    }
    |> plug.call([])
  end

  def send_resp(socket, status, headers, body) do
    response = "HTTP/1.1 #{status}\r\n#{headers(headers)}\r\n#{body}"

    SimpleHttp.send_response(socket, response)
    {:ok, nil, socket}
  end

  @spec child_spec(any, any) :: %{id: SimpleHttp, start: {SimpleHttp, :start_link, [...]}}
  def child_spec(port, plug) do
    SimpleHttp.child_spec(&([port, dispatch(&1, plug)]))
  end

  def headers(headers) do
    Enum.reduce(headers, "", fn {key, value}, acc ->
      acc <> key <> ": " <> value <> "\n\r"
    end)
  end
end
