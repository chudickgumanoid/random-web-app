defmodule ProjectTwo.Repo do
  use Ecto.Repo,
    otp_app: :project_two,
    adapter: Ecto.Adapters.Postgres
end
