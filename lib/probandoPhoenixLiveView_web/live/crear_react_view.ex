defmodule ProbandoPhoenixLiveViewWeb.CrearReactView do
  use Phoenix.LiveView

  def render(assigns) do
    ProbandoPhoenixLiveViewWeb.PageView.render("react.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, crear_step: "Preparado para crear!", status: "listo")}
  end

  def handle_event("crear_app", _value, socket) do
    IO.puts "Creando archivos..."
    System.cmd("create-react-app", ["demo-react"], into: IO.stream(:stdio, :line))
    Process.send_after(self(), :verificar, 1000)
    {:noreply, assign(socket, crear_step: "Creando archivos...", status: "crear")}
  end

  def handle_info(:verificar, socket) do
    IO.puts "Verificando..."
    Process.send_after(self(), :listo, 1000)
    {:noreply, assign(socket, crear_step: "Verificando...", status: "verificar")}
  end

  def handle_info(:listo, socket) do
    IO.puts "¡Listo app con React!"
    {:noreply, assign(socket, crear_step: "¡Listo app con React!", status: "listo")}
  end
end