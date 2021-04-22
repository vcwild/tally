defmodule Tally.Supplies.Email do
  import Bamboo.Email

  alias Tally.Supply

  def create(dest_email, supplies) do
    new_email(
      to: dest_email,
      from: "app@tally.web.com",
      subject: "Supplies are about to expire",
      html_body: "<strong>About your supplies</strong>",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "Supplies that are about to expire:\n"
    Enum.reduce(
      supplies,
      initial_text,
      fn supply, text -> text <> supply_str(supply)
    end)
  end

  defp supply_str(
    %Supply{description: description,
    expiration_date: expiration_date,
    in_charge: in_charge}) do
    "Description: #{description}, Expiration Date: #{expiration_date}, In Charge: #{in_charge}\n"
  end
end
