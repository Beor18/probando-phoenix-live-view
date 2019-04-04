defmodule ProbandoPhoenixLiveViewWeb.PageController do
  use ProbandoPhoenixLiveViewWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.GithubDeployView, session: %{})
  end

  def index_crear(conn, _) do
    LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.CrearReactView, session: %{})
  end

  def consumir(%Plug.Conn{path_info: path_info, request_path: path} = conn, _params) do
    case List.first(path_info) == "wiki" do
      true ->
        redirect_enwiki_requests(conn, path)

      _ ->
        LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.ConsumirApiView, session: %{})
    end
  end

  def redirect_enwiki_requests(conn, path) do
    conn
    |> redirect(external: "https://en.wikipedia.org#{path}")
    |> halt
end
end
