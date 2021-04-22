defmodule Tally.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :in_charge, :restaurant_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :in_charge, :string
    belongs_to :restaurant, Tally.Restaurant
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 5)
    |> validate_length(:in_charge, min: 2)
  end
end
