defmodule Tally do
  alias Tally.Restaurants.Create, as: RestaurantCreate
  alias Tally.Supplies.Create, as: SupplyCreate
  alias Tally.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
