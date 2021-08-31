defmodule PayDo do
  alias PayDo.Users.Create, as: UserCreate
  alias PayDo.Accounts.{Deposit, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
end
