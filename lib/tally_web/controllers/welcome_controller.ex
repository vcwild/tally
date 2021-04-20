defmodule TallyWeb.WelcomeController do
  use TallyWeb, :controller

  alias Tally.Greeter

  def index(conn, params) do
    params
    |> Greeter.greet()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: render_response(conn, message, :ok)

  defp handle_response({:error, message}, conn), do: render_response(conn, message, :bad_request)

  defp render_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
