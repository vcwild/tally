defmodule Tally.Repo.Migrations.CreateSuppliesTable do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :description, :string
      add :expiration_date, :date
      add :in_charge, :string
      add :restaurant_id, references(:restaurants, type: :binary_id)
      timestamps()
    end
  end
end
