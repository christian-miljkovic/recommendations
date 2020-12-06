defmodule RecommendationsWeb.Views.RecommendationView do
  @moduledoc false

  use RecommendationsWeb, :view
  alias __MODULE__

  def render("show.json", %{recommendation: recommendation}) do
    %{
      data: render_one(recommendation, RecommendationView, "recommendation.json")
    }
  end

  def render("recommendation.json", %{recommendation: recommendation}) do
    %{
      id: recommendation.id,
      client_id: recommendation.client_id,
      message: recommendation.message,
      inserted_at: recommendation.inserted_at
    }
  end
end
