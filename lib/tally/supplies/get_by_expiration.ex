defmodule Tally.Supplies.GetByExpiration do
  import Ecto.Query

  alias Tally.{Repo, Restaurant, Supply}

  def call do
    date = Date.utc_today()
    begin_date = Date.beginning_of_week(date)
    end_date = Date.end_of_week(date)

    query =
      from supply in Supply,
        where: supply.expiration_date >= ^begin_date and
              supply.expiration_date <= ^end_date,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn
      %Supply{restaurant: %Restaurant{email: email}} -> email
    end)
  end
end
