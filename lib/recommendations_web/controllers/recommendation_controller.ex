defmodule RecommendationsWeb.RecommendationController do
  use RecommendationsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(202)
    |> text(":)")
  end

  def create(conn, _params) do
    conn
    |> put_status(202)
    |> json(%{data: "success"})
  end
end
