defmodule ArticleTrackerHd.Ecto.Types.Ltree do
  @behaviour Ecto.Type
  def type, do: :ltree

  def blank?, do: false

  def load(tree), do: {:ok, tree}

  def dump(tree), do: {:ok, tree}

  def cast(tree), do: {:ok, tree}
end

