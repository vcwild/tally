defmodule  Tally.RestaurantTest do
  use Tally.DataCase

  alias Ecto.Changeset
  alias Tally.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Restaurante do Ze", email: "ze@ze.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
        changes: %{email: "ze@ze.com", name: "Restaurante do Ze"},
        valid?: true
      } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "R", email: "ze@ze.com"}
      expected_response_errors = %{name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response
      assert expected_response_errors == errors_on(response)
    end
  end
end
