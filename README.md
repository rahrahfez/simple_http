# SimpleHttp

An app that stores up to 15 integers(randomly generated within user defined range) in a node. Starting with a single root node, each node can create other nodes. Nodes can be deleted, removing the list of integers.

Nodes will be stored on a Postgresql database and exposed with http endpoints.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_http` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_http, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/simple_http](https://hexdocs.pm/simple_http).

