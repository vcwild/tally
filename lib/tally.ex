defmodule Tally do
  alias Tally.Restaurants.Create
  defdelegate create_restaurant(params), to: Create, as: :call
end
