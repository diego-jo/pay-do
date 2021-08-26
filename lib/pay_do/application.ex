defmodule PayDo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PayDo.Repo,
      # Start the Telemetry supervisor
      PayDoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PayDo.PubSub},
      # Start the Endpoint (http/https)
      PayDoWeb.Endpoint
      # Start a worker by calling: PayDo.Worker.start_link(arg)
      # {PayDo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PayDo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PayDoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
