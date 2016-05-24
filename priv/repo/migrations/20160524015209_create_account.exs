defmodule ArticleTrackerHd.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :email, :string
      add :password_digest, :string

      timestamps
    end

  end
end
