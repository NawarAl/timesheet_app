defmodule TimesheetApp.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheets" do
    field :date, :date
    field :hours_worked, :integer
    belongs_to :employee, TimesheetApp.Employees.Employee

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:date, :hours_worked, :employee_id])
    |> validate_required([:date, :hours_worked, :employee_id])
  end
end
