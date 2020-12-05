defmodule RecommendationsWeb.Validators.RecommendationParams do
  defmodule DigitsWeb.Validators.SeatInviteParams do
    @moduledoc false

    use Ecto.Schema
    import Ecto.Changeset

    @type t :: %__MODULE__{}

    @cast_fields [
      :client_id,
      :message
    ]

    @primary_key false
    embedded_schema do
      field :client_id, Ecto.UUID
      field :message, :string
    end

    def cast_and_validate(params) do
      params
      |> changeset()
    end

    def changeset(params) do
      %__MODULE__{}
      |> cast(params, @cast_fields)
      |> validate_required(@cast_fields)
      |> validate_length(:message, max: 255)
      |> down_case_message()
    end

    defp down_case_message(changeset) do
      changeset
      |> update_change(:message, &String.downcase/1)
    end
  end
end
