defmodule TimesheetApp.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :address, :string
      add :date_of_birth, :date
      add :department, :string
      add :position, :string
      add :salary, :integer

      timestamps()
    end
  end
end
