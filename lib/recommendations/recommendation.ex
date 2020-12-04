defmodule Recommendations.Recommendation do
  import Ecto.Query, warn: false
  alias Recommendations.Repo

  alias Recommendations.Scehma.Recommendation

  def list_recommendations do
    Repo.all(Recommendation)
  end

  def create_recommendation(attrs \\ %{}) do
    Recommendation.changeset(attrs)
    |> Repo.insert()
  end
end
