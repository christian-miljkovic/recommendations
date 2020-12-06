defmodule Recommendations.Schema.Recommendation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recommendations" do
    field :client_id, Ecto.UUID
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:client_id, :message])
    |> validate_required([:client_id, :message])
  end
end
