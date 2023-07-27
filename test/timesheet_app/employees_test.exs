defmodule TimesheetApp.EmployeesTest do
  use TimesheetApp.DataCase

  alias TimesheetApp.Employees

  describe "employees" do
    alias TimesheetApp.Employees.Employee

    import TimesheetApp.EmployeesFixtures

    @invalid_attrs %{name: nil, email: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Employees.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Employees.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{name: "some name", email: "some email"}

      assert {:ok, %Employee{} = employee} = Employees.create_employee(valid_attrs)
      assert employee.name == "some name"
      assert employee.email == "some email"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email"}

      assert {:ok, %Employee{} = employee} = Employees.update_employee(employee, update_attrs)
      assert employee.name == "some updated name"
      assert employee.email == "some updated email"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Employees.update_employee(employee, @invalid_attrs)
      assert employee == Employees.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Employees.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Employees.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee(employee)
    end
  end

  describe "employees" do
    alias TimesheetApp.Employees.Employee

    import TimesheetApp.EmployeesFixtures

    @invalid_attrs %{name: nil, position: nil, address: nil, email: nil, phone: nil, date_of_birth: nil, department: nil, salary: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Employees.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Employees.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{name: "some name", position: "some position", address: "some address", email: "some email", phone: "some phone", date_of_birth: ~D[2023-07-23], department: "some department", salary: 42}

      assert {:ok, %Employee{} = employee} = Employees.create_employee(valid_attrs)
      assert employee.name == "some name"
      assert employee.position == "some position"
      assert employee.address == "some address"
      assert employee.email == "some email"
      assert employee.phone == "some phone"
      assert employee.date_of_birth == ~D[2023-07-23]
      assert employee.department == "some department"
      assert employee.salary == 42
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{name: "some updated name", position: "some updated position", address: "some updated address", email: "some updated email", phone: "some updated phone", date_of_birth: ~D[2023-07-24], department: "some updated department", salary: 43}

      assert {:ok, %Employee{} = employee} = Employees.update_employee(employee, update_attrs)
      assert employee.name == "some updated name"
      assert employee.position == "some updated position"
      assert employee.address == "some updated address"
      assert employee.email == "some updated email"
      assert employee.phone == "some updated phone"
      assert employee.date_of_birth == ~D[2023-07-24]
      assert employee.department == "some updated department"
      assert employee.salary == 43
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Employees.update_employee(employee, @invalid_attrs)
      assert employee == Employees.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Employees.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Employees.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee(employee)
    end
  end
end
