defmodule TallyWeb.RestaurantsController do
  use TallyWeb, :controller

  alias Tally.Restaurant
  alias TallyWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Tally.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
