defmodule NtntkrBackend.Repo.Migrations.CreateNotebooks do
  use Ecto.Migration

  def change do
    create table(:notebooks) do
      add :name, :string
      add :start_date, :date
      add :end_date, :date
      add :type, :string
      add :contents, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:notebooks, [:user_id])
  end
end
