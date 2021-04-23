defmodule Tally.GreeterTest do
  use ExUnit.Case, async: true

  alias Tally.Greeter

  describe "greet/1" do
    test "when user is specifically matching, return a special message" do
      params = %{"name" => "banana \t \r", "age" => "42"}
      expected_result = {:ok, "Hello Banana, you are matching!"}

      result = Greeter.greet(params)

      assert result == expected_result
    end

    test "when user matches, is over 18 but is not specifical, return a greeting message" do
      params = %{"name" => "user \t \r", "age" => "18"}
      expected_result = {:ok, "Welcome User, you are an adult"}

      result = Greeter.greet(params)

      assert result == expected_result
    end

    test "when user is under 18 years old, return `:error` and a message" do
      params = %{"name" => "user \t \r", "age" => "16"}
      expected_result = {:error, "Sorry User, you are only 16"}

      result = Greeter.greet(params)

      assert result == expected_result
    end
  end
end
