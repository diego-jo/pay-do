defmodule PayDo.Accounts.Transaction do
  alias Ecto.Multi
  alias PayDo.Accounts.Operation
  alias PayDo.Repo
  alias PayDo.Accounts.Transactions.Response, as: TransactionResponse

  def call(%{"from" => from_id, "to" => to_id, "value" => value}) do
    deposit_params = build_params(to_id, value)
    withdraw_params = build_params(from_id, value)

    Multi.new()
    |> Multi.merge(fn _useless -> Operation.call(withdraw_params, :withdraw) end)
    |> Multi.merge(fn _useless -> Operation.call(deposit_params, :deposit) end)
    |> run_transaction()
  end

  defp build_params(id, value), do: %{"id" => id, "value" => value}

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} ->
        {:error, reason}

      {:ok, %{withdraw: from_account, deposit: to_account}} ->
        {:ok, TransactionResponse.build(from_account, to_account)}
    end
  end
end
