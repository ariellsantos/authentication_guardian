defmodule AuthLogin.Repo.Migrations.CreateMaquinas do
  use Ecto.Migration

  def change do
    create table(:maquinas) do
      add :nombre, :string
      add :serial, :string

      timestamps()
    end

  end
end
