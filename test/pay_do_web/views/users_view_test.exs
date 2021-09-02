defmodule PayDoWeb.UsersViewTest do
  use PayDoWeb.ConnCase, async: true

  alias(PayDo.{Account, User})
  alias PayDoWeb.UsersView

  import Phoenix.View

  test "renders create.json" do
    params = %{
      name: "Diego",
      password: "123455",
      nickname: "md_rick",
      email: "user@email.com",
      age: 31
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      PayDo.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Diego",
        nickname: "md_rick"
      }
    }

    assert expected_response == response
  end
end
