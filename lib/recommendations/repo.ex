defmodule Recommendations.Repo do
  use Ecto.Repo,
    otp_app: :recommendations,
    adapter: Ecto.Adapters.Postgres
end
