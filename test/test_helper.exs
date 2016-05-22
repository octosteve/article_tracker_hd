ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ArticleTrackerHd.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ArticleTrackerHd.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ArticleTrackerHd.Repo)

