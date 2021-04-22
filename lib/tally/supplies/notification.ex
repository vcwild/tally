defmodule Tally.Supplies.Notification do
  alias Tally.Mailer
  alias Tally.Supplies.{Email, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {dest_email, supplies} ->
      dest_email
      |> Email.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
