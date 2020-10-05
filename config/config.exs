import Config

config :simple_http, ecto_repos: [SimpleHttp.Repo]
config :simple_http, :repo, SimpleHttp.Repo

 import_config "#{Mix.env()}.exs"
