defmodule SimpleHttp.Repo.Migrations.CreateNumbersTable do
  use Ecto.Migration

  def change do
    create table(:simple_http) do
      add :root, :string
      add :list, {:array, :integer}
      add :children, {:array, :integer}
    end
  end
end
