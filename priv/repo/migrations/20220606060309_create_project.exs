defmodule ProjectTwo.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:test) do
      add :eng, :string
      add :rus, :string
    end
  end
end
