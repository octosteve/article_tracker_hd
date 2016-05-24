defmodule ArticleTrackerHd.Repo.Migrations.AddAccountReferenceToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :account_id, references(:accounts)
    end
  end
end
