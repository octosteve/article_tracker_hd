defmodule ArticleTrackerHd.PageController do
  use ArticleTrackerHd.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
