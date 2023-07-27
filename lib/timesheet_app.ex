defmodule TimesheetApp do
  @moduledoc """
  TimesheetApp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API, or others.
  """

  defstruct date: nil, hours_worked: 0

  def create_timesheet(date, hours_worked) do
    %TimesheetApp{date: date, hours_worked: hours_worked}
  end

  def update_hours_worked(timesheet, new_hours) do
    %{timesheet | hours_worked: new_hours}
  end

  # def total_hours_worked(timesheets) do
  #  Enum.sum(timesheets, & &1.hours_worked)
  # end

  def total_hours_worked(timesheets) do
    Enum.reduce(timesheets, 0, fn timesheet, acc -> acc + timesheet.hours_worked end)
  end
end

# Usage example
timesheet1 = TimesheetApp.create_timesheet("2023-07-01", 8)
timesheet2 = TimesheetApp.create_timesheet("2023-07-02", 7.5)
timesheets = [timesheet1, timesheet2]

IO.puts("Total hours worked: #{TimesheetApp.total_hours_worked(timesheets)}")
