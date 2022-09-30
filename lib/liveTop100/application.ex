defmodule LiveTop100.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveTop100.Repo,
      # Start the Telemetry supervisor
      LiveTop100Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveTop100.PubSub},
      # Start the Endpoint (http/https)
      LiveTop100Web.Endpoint
      # Start a worker by calling: LiveTop100.Worker.start_link(arg)
      # {LiveTop100.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveTop100.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveTop100Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
