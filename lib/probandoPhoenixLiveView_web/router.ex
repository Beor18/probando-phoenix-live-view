defmodule ProbandoPhoenixLiveViewWeb.Router do
  use ProbandoPhoenixLiveViewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProbandoPhoenixLiveViewWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/react", PageController, :index_crear
    get "/consumir", PageController, :consumir
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProbandoPhoenixLiveViewWeb do
  #   pipe_through :api
  # end
end
