defmodule ArticleTrackerHd.Router do
  use ArticleTrackerHd.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", ArticleTrackerHd do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ArticleTrackerHd do
    pipe_through :api
    resources "/articles", ArticleController, except: [:new, :edit]
    post "/log-in", SessionController, :create
  end
end
