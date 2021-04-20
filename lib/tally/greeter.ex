defmodule Tally.Greeter do
  def greet(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()
    name
      |> String.trim()
      |> String.downcase()
      |> String.capitalize()
      |> eval(age)
  end

  defp eval("Banana", 42) do
    {:ok, "Hello Banana, you are matching!"}
  end

  defp eval(name, age) when age >= 18 do
    {:ok, "Welcome #{name}, you are an adult"}
  end

  defp eval(name, age) do
    {:error, "Sorry #{name}, you are only #{age}"}
  end
end
