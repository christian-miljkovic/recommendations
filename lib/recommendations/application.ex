defmodule Recommendations.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Recommendations.Repo,
      # Start the Telemetry supervisor
      RecommendationsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Recommendations.PubSub},
      # Start the Endpoint (http/https)
      RecommendationsWeb.Endpoint
      # Start a worker by calling: Recommendations.Worker.start_link(arg)
      # {Recommendations.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Recommendations.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RecommendationsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
