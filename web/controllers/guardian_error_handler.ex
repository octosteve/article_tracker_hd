defmodule ArticleTrackerHd.GuardianErrorHandler do
  use ArticleTrackerHd.Web, :controller
  alias ArticleTrackerHd.GuardianErrorView
  def unauthenticated(conn, _params) do
      conn
      |> put_status(:forbidden)
      |> render(GuardianErrorView, :forbidden)
    end
end
