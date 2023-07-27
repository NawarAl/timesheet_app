defmodule TimesheetApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TimesheetAppWeb.Telemetry,
      # Start the Ecto repository
      TimesheetApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TimesheetApp.PubSub},
      # Start Finch
      {Finch, name: TimesheetApp.Finch},
      # Start the Endpoint (http/https)
      TimesheetAppWeb.Endpoint
      # Start a worker by calling: TimesheetApp.Worker.start_link(arg)
      # {TimesheetApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TimesheetApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TimesheetAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
