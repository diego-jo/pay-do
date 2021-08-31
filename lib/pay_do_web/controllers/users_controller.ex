defmodule PayDoWeb.UsersController do
  use PayDoWeb, :controller

  alias PayDo.User

  action_fallback PayDoWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- PayDo.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
