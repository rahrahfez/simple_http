defmodule SimpleHttp.Node do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :list, :root_id]

  schema "simple_http" do
    field :name, :string
    field :list, {:array, :integer}
    field :root_id, :integer, default: 0
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:name])
  end

  # defp validate_list_length(changeset) do
  #   list = get_field(changeset, :list)
  # end
end
