defmodule ProbandoPhoenixLiveViewWeb.PageController do
  use ProbandoPhoenixLiveViewWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, ProbandoPhoenixLiveViewWeb.GithubDeployView, session: %{})
  end
end
