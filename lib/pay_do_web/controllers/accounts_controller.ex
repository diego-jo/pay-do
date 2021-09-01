defmodule PayDoWeb.AccountsController do
  use PayDoWeb, :controller

  alias PayDo.Account
  alias PayDo.Accounts.Transactions.Response, as: TransactionResponse

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

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- PayDo.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
