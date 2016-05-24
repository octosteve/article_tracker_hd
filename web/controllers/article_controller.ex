defmodule ArticleTrackerHd.ArticleController do
  use ArticleTrackerHd.Web, :controller

  alias ArticleTrackerHd.Article

  plug Guardian.Plug.EnsureAuthenticated, [handler: ArticleTrackerHd.GuardianErrorHandler]  when action in [:create, :update, :delete]
  plug :scrub_params, "article" when action in [:create, :update]

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    account = Guardian.Plug.current_resource(conn)
    article = Ecto.build_assoc(account, :articles)
    changeset = Article.changeset(article, article_params)

    case Repo.insert(changeset) do
      {:ok, article} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", article_path(conn, :show, article))
        |> render("show.json", article: article)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ArticleTrackerHd.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)
    render(conn, "show.json", article: article)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Repo.get!(Article, id)
    changeset = Article.changeset(article, article_params)

    case Repo.update(changeset) do
      {:ok, article} ->
        render(conn, "show.json", article: article)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ArticleTrackerHd.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(article)

    send_resp(conn, :no_content, "")
  end
end
