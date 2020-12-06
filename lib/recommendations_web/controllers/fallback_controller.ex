defmodule RecommendationsWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(422)
    |> put_view(RecommendationsWeb.ErrorView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, %{__exception__: true} = error}) do
    conn
    |> put_status(Plug.Exception.status(error))
    |> put_view(RecommendationsWeb.ErrorView)
    |> json(%{errors: [%{detail: Exception.message(error)}]})
  end
end
