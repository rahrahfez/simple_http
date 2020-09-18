defmodule SimpleHttp.Root do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:root_name, :list, :root_id]

  schema "root" do
    field :root_name, :string
    field :list, {:array, :integer}
    field :root_id, :integer
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:root_name])
  end

  # defp validate_list_length(changeset) do
  #   list = get_field(changeset, :list)
  # end
end
