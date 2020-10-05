defmodule SimpleHttp.Node do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:root_name, :list, :root_id]

  schema "number_tree" do
    field :root_id, :integer, default: 0
    field :root_name, :string
    field :list, {:array, :integer}
    field :children, {:array, :integer}
    field :parent_id, :integer
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:root_name])
  end
end
