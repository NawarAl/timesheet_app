defmodule TimesheetApp.TimesheetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimesheetApp.Timesheets` context.
  """

  @doc """
  Generate a timesheet.
  """
  def timesheet_fixture(attrs \\ %{}) do
    {:ok, timesheet} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-07-17],
        hours_worked: 42
      })
      |> TimesheetApp.Timesheets.create_timesheet()

    timesheet
  end
end
