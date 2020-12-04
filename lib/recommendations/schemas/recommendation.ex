defmodule Recommendations.Scehma.Recommendation do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  embedded_schema do
    field :client_id, Ecto.UUID
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:client_id, :message])
    |> validate_required([:client_id, :message])
  end
end
