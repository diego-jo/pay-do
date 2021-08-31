defmodule PayDo.Accounts.Withdraw do
  alias Ecto.Multi
  alias PayDo.{Account, Repo, User}

  def call(params) do
    # Multi.new()
    # |> Multi.insert(:create_user, User.changeset(params))
    # |> Multi.run(:create_account, fn repo, %{create_user: user} -> insert_account(repo, user) end)
    # |> Multi.run(:preload_data, fn repo, %{create_user: user} -> preload_data(repo, user) end)
    # |> run_transaction()
  end
end
