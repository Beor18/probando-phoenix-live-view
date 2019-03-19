defmodule ProbandoPhoenixLiveViewWeb.GithubDeployView do
  use Phoenix.LiveView

  def render(assigns) do
    ProbandoPhoenixLiveViewWeb.PageView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Preparado para comenzar!", status: "ready")}
  end

  def handle_event("github_deploy", _value, socket) do
    IO.puts "Agregando archivos..."
    System.cmd("git", ["add", "."], into: IO.stream(:stdio, :line))
    Process.send_after(self(), :create_org, 1000)
    {:noreply, assign(socket, deploy_step: "Agregando archivos...", status: "deploy")}
  end

  def handle_info(:create_org, socket) do
    IO.puts "Creando Commit..."
    System.cmd("git", ["commit", "-m", "modificado"], into: IO.stream(:stdio, :line))
    Process.send_after(self(), :create_repo, 1000)
    {:noreply, assign(socket, deploy_step: "Creando Commit...", status: "create-org")}
  end

  def handle_info(:create_repo, socket) do
    IO.puts "Creando repo"
    Process.send_after(self(), :push_contents, 1000)
    {:noreply, assign(socket, deploy_step: "Creando repo", status: "create-repo")}
  end

  def handle_info(:push_contents, socket) do
    IO.puts "Push a Repo..."
    Process.send_after(self(), :done, 1000)
    {:noreply, assign(socket, deploy_step: "Push a Repo...", status: "push-contents")}
  end

  def handle_info(:done, socket) do
    IO.puts "¡Listo!"
    {:noreply, assign(socket, deploy_step: "¡Listo!", status: "done")}
  end
end