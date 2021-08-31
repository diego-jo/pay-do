defmodule PayDoWeb.AccountsController do
  use PayDoWeb, :controller

  alias PayDo.Account

  action_fallback PayDoWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- PayDo.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- PayDo.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
