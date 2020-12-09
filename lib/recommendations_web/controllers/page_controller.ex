defmodule RecommendationsWeb.PageController do
  use RecommendationsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(202)
    |> text(":)")
  end
end
