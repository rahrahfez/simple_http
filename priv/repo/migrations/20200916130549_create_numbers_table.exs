defmodule SimpleHttp.Repo.Migrations.CreateNumbersTable do
  use Ecto.Migration

  def change do
    create table(:simple_http) do
      add :name, :string
      add :list, {:array, :integer}
      add :root_id, :integer
    end
  end
end
