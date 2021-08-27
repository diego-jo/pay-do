defmodule PayDo do
  alias PayDo.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
