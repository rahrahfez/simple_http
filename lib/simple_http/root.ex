defmodule SimpleHttp.Root do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "root" do
    field :root, :integer
    field :list, {:array, :integer}
    field :children, :integer
  end


end
