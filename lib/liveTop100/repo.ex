defmodule LiveTop100.Repo do
  use Ecto.Repo,
    otp_app: :liveTop100,
    adapter: Ecto.Adapters.Postgres
end
