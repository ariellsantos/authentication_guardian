defmodule AuthLoginWeb.MaquinaView do
  use AuthLoginWeb, :view
  alias AuthLoginWeb.MaquinaView

  def render("index.json", %{maquinas: maquinas}) do
    %{data: render_many(maquinas, MaquinaView, "maquina.json")}
  end

  def render("show.json", %{maquina: maquina}) do
    %{data: render_one(maquina, MaquinaView, "maquina.json")}
  end

  def render("maquina.json", %{maquina: maquina}) do
    %{id: maquina.id,
      nombre: maquina.nombre,
      serial: maquina.serial}
  end
end
