defmodule TimesheetApp.Repo.Migrations.CreateTimesheets do
  use Ecto.Migration

  def change do
    create table(:timesheets) do
      add :date, :date
      add :hours_worked, :integer
      add :description, :string
      add :employee_id, references(:employees, on_delete: :delete_all)

      timestamps()
    end

    create index(:timesheets, [:employee_id])

  end
end
