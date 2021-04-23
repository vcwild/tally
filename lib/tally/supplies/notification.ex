defmodule Tally.Supplies.Notification do
  alias Tally.Mailer
  alias Tally.Supplies.{Email, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {dest_email, supplies} ->
         send_email(dest_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(dest_email, supplies) do
    dest_email
    |> Email.create(supplies)
    |> Mailer.deliver_later!()
  end
end
