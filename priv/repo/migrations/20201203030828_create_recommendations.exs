defmodule Recommendations.Repo.Migrations.CreateRecommendations do
  use Ecto.Migration

  def change do
    create table(:recommendations) do
      add :client_id, :uuid
      add :message, :string

      timestamps()
    end

  end
end
