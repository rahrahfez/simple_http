defmodule SimpleHttp.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias SimpleHttp.Router

  @content "<html><body>HI!</body></html>"
  @mimetype "text/html"

  @opts Router.init([])

  test "should return welcome" do
    conn =
      :get
      |> conn("/", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "should return uploaded" do
    conn =
      :get
      |> conn("/upload?content=#{@content}&mimetype=#{@mimetype}")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 201
  end

  test "should return 404" do
    conn =
      :get
      |> conn("/waldo", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end
