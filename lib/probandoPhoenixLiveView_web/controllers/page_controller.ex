defmodule ProbandoPhoenixLiveViewWeb.PageController do
  use ProbandoPhoenixLiveViewWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.GithubDeployView, session: %{})
  end

  def index_crear(conn, _) do
    LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.CrearReactView, session: %{})
  end

  def consumir(conn, _) do
   LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.ConsumirApiView, session: %{})
  end
  
end
