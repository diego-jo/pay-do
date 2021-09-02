defmodule PayDo.Users.CreateTest do
  use PayDo.DataCase, async: true

  alias PayDo.User
  alias PayDo.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Diego",
        password: "123455",
        nickname: "md_rick",
        email: "user@email.com",
        age: 31
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Diego", age: 31, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Diego",
        password: "123455",
        nickname: "md_rick",
        age: 17
      }

      {:error, changeset} = Create.call(params)

      assert %{email: ["can't be blank"], age: ["must be greater than or equal to 18"]} ==
               errors_on(changeset)
    end
  end
end
