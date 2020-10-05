defmodule SimpleHttp.Repo.Migrations.InitialMigrations do
  use Ecto.Migration

  def change do
    create table(:number_tree) do
      add :root_id, :integer
      add :root_name, :string
      add :number_list, {:array, :integer}
      add :children_list, {:array, :integer}
      add :parent_id, :integer
    end
  end
end
