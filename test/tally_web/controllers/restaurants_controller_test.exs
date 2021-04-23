defmodule TallyWeb.RestaurantsControllerTest do
  use TallyWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, create a user", %{conn: conn} do
      params = %{name: "Restaurante do Ze", email: "ze@ze.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

        assert %{
          "message" => "Restaurant created!",
          "restaurant" => %{
            "email" => "ze@ze.com",
            "id" => _id,
            "name" => "Restaurante do Ze"}} = response
    end

    test "when params not valid, return error message", %{conn: conn} do
      params = %{name: "R", email: "ze@ze.com"}
      expected_response_errors = %{"message" =>
        %{"name" => ["should be at least 2 character(s)"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

        assert expected_response_errors == response
    end
  end
end
