defmodule TimesheetApp.Employees.Employee do
  use Ecto.Schema

  schema "employees" do
    field :name, :string
    field :position, :string
    field :address, :string
    field :email, :string
    field :phone, :string
    field :date_of_birth, :date
    field :department, :string
    field :salary, :integer

    timestamps()
  end

  @doc false
  def changeset(employee, attrs  \\ %{}) do
    employee
    |> Ecto.Changeset.cast(attrs, [:name, :email, :phone, :address, :date_of_birth, :department, :position, :salary])
    |> Ecto.Changeset.validate_required([:name, :email, :phone, :address, :date_of_birth, :department, :position, :salary])
  end
end
