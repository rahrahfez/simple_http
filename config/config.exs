import Config

config :simple_http, ecto_repos: [SimpleHttp.Repo]

config :simple_http, SimpleHttp.Repo,
  database: "simple_http_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost"

  import_config "#{Mix.env()}.exs"
