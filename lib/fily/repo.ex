defmodule Fily.Repo do
  use Ecto.Repo,
    otp_app: :fily,
    adapter: Ecto.Adapters.Postgres
end
