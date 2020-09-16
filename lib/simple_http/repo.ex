defmodule SimpleHttp.Repo do
  use Ecto.Repo,
    otp_app: :simple_http,
    adapter: Ecto.Adapters.Postgres
end
