defmodule PayDoWeb.FallbackController do
  use PayDoWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PayDoWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
