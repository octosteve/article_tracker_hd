defmodule ArticleTrackerHd.Postgrex.Types.Lquery do
  alias Postgrex.TypeInfo

  @behaviour Postgrex.Extension

  def init(_parameters, _opts), do: {}

  def matching(_), do: [type: "lquery"]

  def format(_), do: :text

  def encode(%TypeInfo{type: "lquery"}, value, _state, _opts), do: value

  def decode(%TypeInfo{type: "lquery"}, value, _state, _opts), do: value
end
