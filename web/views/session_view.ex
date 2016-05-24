defmodule ArticleTrackerHd.SessionView do
  use ArticleTrackerHd.Web, :view

  def render("login.json", %{jwt: jwt}) do
    %{ jwt: jwt }
  end
end
