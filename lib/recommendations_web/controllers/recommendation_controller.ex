defmodule RecommendationsWeb.RecommendationController do
  alias Recommendations.Recommendation
  alias RecommendationsWeb.Validators.RecommendationParams
  alias RecommendationsWeb.Views.RecommendationView

  use RecommendationsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(202)
    |> text(":)")
  end

  def create(conn, params) do
    with {:ok, validated_params} = RecommendationParams.cast_and_validate(params),
         {:ok, recommendation} = Recommendation.create_recommendation(validated_params) do
      conn
      |> put_status(202)
      |> render(conn, "show.json", recommendation: recommendation)
    end
  end
end
