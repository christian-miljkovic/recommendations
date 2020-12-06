defmodule Recommendations.Recommendation do
  import Ecto.Query, warn: false
  alias Recommendations.Repo

  alias Recommendations.Schema.Recommendation

  def list_recommendations do
    Repo.all(Recommendation)
  end

  def create_recommendation(attrs \\ %{}) do
    attrs
    |> Recommendation.changeset()
    |> Repo.insert()
  end
end
