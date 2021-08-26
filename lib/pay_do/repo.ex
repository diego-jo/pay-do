defmodule PayDo.Repo do
  use Ecto.Repo,
    otp_app: :pay_do,
    adapter: Ecto.Adapters.Postgres
end
