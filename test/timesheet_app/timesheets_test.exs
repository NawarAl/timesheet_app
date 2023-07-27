defmodule TimesheetApp.TimesheetsTest do
  use TimesheetApp.DataCase

  alias TimesheetApp.Timesheets

  describe "timesheets" do
    alias TimesheetApp.Timesheets.Timesheet

    import TimesheetApp.TimesheetsFixtures

    @invalid_attrs %{date: nil, hours_worked: nil}

    test "list_timesheets/0 returns all timesheets" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheets() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      valid_attrs = %{date: ~D[2023-07-17], hours_worked: 42}

      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(valid_attrs)
      assert timesheet.date == ~D[2023-07-17]
      assert timesheet.hours_worked == 42
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      update_attrs = %{date: ~D[2023-07-18], hours_worked: 43}

      assert {:ok, %Timesheet{} = timesheet} = Timesheets.update_timesheet(timesheet, update_attrs)
      assert timesheet.date == ~D[2023-07-18]
      assert timesheet.hours_worked == 43
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end
end
