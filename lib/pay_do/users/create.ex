defmodule PayDo.Users.Create do
  alias PayDo.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
