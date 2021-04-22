defmodule Tally.Supplies.Get do
  alias Tally.{Supply, Repo}

  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil    -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
