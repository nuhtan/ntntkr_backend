defmodule NtntkrBackend.Repo do
  use Ecto.Repo,
    otp_app: :ntntkr_backend,
    adapter: Ecto.Adapters.Postgres
end
