defmodule TallyWeb.RestaurantsView do
  use TallyWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end
