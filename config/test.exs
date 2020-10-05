import Config

config :simple_http, SimpleHttp.Repo,
  database: "simple_http_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

