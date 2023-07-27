defmodule TimesheetAppWeb.TimesheetController do
  use TimesheetAppWeb, :controller
  require Logger

  #import TimesheetAppWeb.Router.Helpers

  alias TimesheetApp.Timesheet
  alias TimesheetApp.Timesheets
  alias TimesheetApp.Timesheets.Timesheet


  # Modify - Index action to list timesheets under an employee
  def index(conn, %{"employee_id" => employee_id}) do
    employee = Timesheets.get_employee!(employee_id)
    timesheets = Timesheets.list_timesheets_by_employee(employee_id)
    render(conn, :index, employee: employee, timesheets: timesheets)
  end

  # Modify - New action to create a new timesheet under an employee
  def new(conn, %{"employee_id" => employee_id}) do
    employee = Timesheets.get_employee!(employee_id)
    changeset = Timesheet.change_timesheet(%Timesheet{employee_id: employee_id})
    render(conn, :new, employee: employee, changeset: changeset)
  end

  # Modify - Create action to handle timesheet creation under an employee
  def create(conn, %{"employee_id" => employee_id, "timesheet" => timesheet_params}) do
    employee = Timesheets.get_employee!(employee_id)

    case Timesheets.create_timesheet(Map.put(timesheet_params, "employee_id", employee_id)) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet created successfully.")
        |> redirect(to: Routes.employee_timesheet_path(conn, :show, employee, timesheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, employee: employee, changeset: changeset)
    end
  end

  # Modify - Show action may not need changes as it shows a specific timesheet

  # Modify - Edit action to edit a timesheet under an employee
  def edit(conn, %{"employee_id" => employee_id, "id" => id}) do
    employee = Timesheets.get_employee!(employee_id)
    timesheet = Timesheets.get_timesheet!(id)
    changeset = Timesheets.change_timesheet(timesheet)
    render(conn, :edit, employee: employee, timesheet: timesheet, changeset: changeset)
  end

  # Modify - Update action to handle timesheet update under an employee
  def update(conn, %{"employee_id" => employee_id, "id" => id, "timesheet" => timesheet_params}) do
    employee = Timesheets.get_employee!(employee_id)
    timesheet = Timesheets.get_timesheet!(id)

    case Timesheets.update_timesheet(timesheet, timesheet_params) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet updated successfully.")
        |> redirect(to: Routes.employee_timesheet_path(conn, :show, employee, timesheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, employee: employee, timesheet: timesheet, changeset: changeset)
    end
  end

  # Modify - Delete action to delete a timesheet under an employee
  def delete(conn, %{"employee_id" => employee_id, "id" => id}) do
    employee = Timesheets.get_employee!(employee_id)
    timesheet = Timesheets.get_timesheet!(id)
    {:ok, _timesheet} = Timesheets.delete_timesheet(timesheet)

    conn
    |> put_flash(:info, "Timesheet deleted successfully.")
    |> redirect(to: Routes.employee_timesheet_path(conn, :index, employee))
  end
end
