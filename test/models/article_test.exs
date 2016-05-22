defmodule ArticleTrackerHd.ArticleTest do
  use ArticleTrackerHd.ModelCase

  alias ArticleTrackerHd.Article

  @valid_attrs %{categories: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
