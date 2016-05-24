defmodule ArticleTrackerHd.AccountTest do
  use ArticleTrackerHd.ModelCase

  alias ArticleTrackerHd.Account

  @valid_attrs %{email: "some content", password_digest: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Account.changeset(%Account{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Account.changeset(%Account{}, @invalid_attrs)
    refute changeset.valid?
  end
end
