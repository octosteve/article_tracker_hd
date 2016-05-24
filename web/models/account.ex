defmodule ArticleTrackerHd.Account do
  use ArticleTrackerHd.Web, :model

  schema "accounts" do
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true
    has_many :articles, ArticleTrackerHd.Article

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  def find_by_email(email) do
    from a in __MODULE__,
    where: a.email == ^email
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    password = changeset.changes.password
    put_change(changeset, :password_digest, Comeonin.Bcrypt.hashpwsalt(password))
  end
end
