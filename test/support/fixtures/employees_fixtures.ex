defmodule TimesheetApp.EmployeesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimesheetApp.Employees` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        name: "some name",
        email: "some email"
      })
      |> TimesheetApp.Employees.create_employee()

    employee
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        name: "some name",
        position: "some position",
        address: "some address",
        email: "some email",
        phone: "some phone",
        date_of_birth: ~D[2023-07-23],
        department: "some department",
        salary: 42
      })
      |> TimesheetApp.Employees.create_employee()

    employee
  end
end
