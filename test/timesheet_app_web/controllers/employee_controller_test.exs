defmodule TimesheetAppWeb.EmployeeControllerTest do
  use TimesheetAppWeb.ConnCase

  import TimesheetApp.EmployeesFixtures

  @create_attrs %{name: "some name", position: "some position", address: "some address", email: "some email", phone: "some phone", date_of_birth: ~D[2023-07-23], department: "some department", salary: 42}
  @update_attrs %{name: "some updated name", position: "some updated position", address: "some updated address", email: "some updated email", phone: "some updated phone", date_of_birth: ~D[2023-07-24], department: "some updated department", salary: 43}
  @invalid_attrs %{name: nil, position: nil, address: nil, email: nil, phone: nil, date_of_birth: nil, department: nil, salary: nil}

  describe "index" do
    test "lists all employees", %{conn: conn} do
      conn = get(conn, ~p"/employees")
      assert html_response(conn, 200) =~ "Listing Employees"
    end
  end

  describe "new employee" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/employees/new")
      assert html_response(conn, 200) =~ "New Employee"
    end
  end

  describe "create employee" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/employees", employee: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/employees/#{id}"

      conn = get(conn, ~p"/employees/#{id}")
      assert html_response(conn, 200) =~ "Employee #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/employees", employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Employee"
    end
  end

  describe "edit employee" do
    setup [:create_employee]

    test "renders form for editing chosen employee", %{conn: conn, employee: employee} do
      conn = get(conn, ~p"/employees/#{employee}/edit")
      assert html_response(conn, 200) =~ "Edit Employee"
    end
  end

  describe "update employee" do
    setup [:create_employee]

    test "redirects when data is valid", %{conn: conn, employee: employee} do
      conn = put(conn, ~p"/employees/#{employee}", employee: @update_attrs)
      assert redirected_to(conn) == ~p"/employees/#{employee}"

      conn = get(conn, ~p"/employees/#{employee}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, employee: employee} do
      conn = put(conn, ~p"/employees/#{employee}", employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Employee"
    end
  end

  describe "delete employee" do
    setup [:create_employee]

    test "deletes chosen employee", %{conn: conn, employee: employee} do
      conn = delete(conn, ~p"/employees/#{employee}")
      assert redirected_to(conn) == ~p"/employees"

      assert_error_sent 404, fn ->
        get(conn, ~p"/employees/#{employee}")
      end
    end
  end

  defp create_employee(_) do
    employee = employee_fixture()
    %{employee: employee}
  end
end
