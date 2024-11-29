defmodule NtntkrBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NtntkrBackendWeb.Telemetry,
      NtntkrBackend.Repo,
      {DNSCluster, query: Application.get_env(:ntntkr_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NtntkrBackend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NtntkrBackend.Finch},
      # Start a worker by calling: NtntkrBackend.Worker.start_link(arg)
      # {NtntkrBackend.Worker, arg},
      # Start to serve requests, typically the last entry
      NtntkrBackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NtntkrBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NtntkrBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
