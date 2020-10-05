defmodule Mix.Tasks.Test.Pretty do
  @moduledoc "Runs test with formatter."
  use Mix.Task
  @impl Mix.Task
  @shortdoc "Runs test with --formatter flag"
  def run(_) do
    Mix.env(:test)

    Mix.Task.run("test", ["--formatter", "ExPrettyTest.Formatter"])
  end
end
