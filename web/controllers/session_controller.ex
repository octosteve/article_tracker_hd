defmodule ArticleTrackerHd.SessionController do
  use ArticleTrackerHd.Web, :controller
  alias ArticleTrackerHd.Auth

  def create(conn, %{"account" => %{"email" => email, "password" => password}}) do
    case Auth.verify(email, password) do
      {:ok, account} ->
         conn
         |> sign_in(account)
         |> render("login.json")
      {:error, _} ->
        conn
        |> put_status(:unprocessable_entity)
    end
  end

  defp sign_in(conn, account) do
     conn
     |> Guardian.Plug.api_sign_in(account)
     |> add_jwt
  end

  defp add_jwt(conn) do
    jwt = Guardian.Plug.current_token(conn)
    assign(conn, :jwt, jwt)
  end
end
