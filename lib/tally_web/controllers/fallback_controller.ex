defmodule TallyWeb.FallbackController do
  use TallyWeb, :controller

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(TallyWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
