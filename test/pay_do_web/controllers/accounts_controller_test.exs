defmodule PayDoWeb.AccountsControllerTest do
  use PayDoWeb.ConnCase, async: true

  alias PayDo.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Fulano",
        password: "123455",
        nickname: "md_rick",
        email: "user@email.com",
        age: 31
      }

      {:ok, %User{account: %Account{id: account_id}}} = PayDo.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cmljazpzYW5jaGV6MTIz")

      {:ok, conn: conn, account_id: account_id}
    end

    test "When all params are right, do the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "100.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{
                 "balance" => "100.00",
                 "id" => _useless_id
               },
               "message" => "Balance changed successfully"
             } = response
    end

    test "When there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "portal"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
