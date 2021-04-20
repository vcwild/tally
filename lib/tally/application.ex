defmodule Tally.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tally.Repo,
      # Start the Telemetry supervisor
      TallyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tally.PubSub},
      # Start the Endpoint (http/https)
      TallyWeb.Endpoint
      # Start a worker by calling: Tally.Worker.start_link(arg)
      # {Tally.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tally.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TallyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
