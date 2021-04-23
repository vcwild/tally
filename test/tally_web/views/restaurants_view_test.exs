defmodule Tally.RestaurantsViewTest do
  use TallyWeb.ConnCase, async: true

  import Phoenix.View

  alias TallyWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Restaurant", email: "res@taurant.com"}

      {:ok, restaurant} = Tally.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
        message: "Restaurant created!",
        restaurant: %Tally.Restaurant{
          email: "res@taurant.com",
          id: _id,
          name: "Restaurant"
        }
      } = response
    end
  end
end
