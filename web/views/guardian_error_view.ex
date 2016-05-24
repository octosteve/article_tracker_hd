defmodule ArticleTrackerHd.GuardianErrorView do
  use ArticleTrackerHd.Web, :view
  def render("forbidden.json", _assigns) do
    %{message: "Forbidden"}
  end
end
