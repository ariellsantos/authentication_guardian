defmodule AuthLoginWeb.MaquinaController do
  use AuthLoginWeb, :controller

  alias AuthLogin.Empresa
  alias AuthLogin.Empresa.Maquina

  action_fallback AuthLoginWeb.FallbackController

  def index(conn, _params) do
    maquinas = Empresa.list_maquinas()
    render(conn, "index.json", maquinas: maquinas)
  end

  def create(conn, %{"maquina" => maquina_params}) do
    with {:ok, %Maquina{} = maquina} <- Empresa.create_maquina(maquina_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", maquina_path(conn, :show, maquina))
      |> render("show.json", maquina: maquina)
    end
  end

  def show(conn, %{"id" => id}) do
    maquina = Empresa.get_maquina!(id)
    render(conn, "show.json", maquina: maquina)
  end

  def update(conn, %{"id" => id, "maquina" => maquina_params}) do
    maquina = Empresa.get_maquina!(id)

    with {:ok, %Maquina{} = maquina} <- Empresa.update_maquina(maquina, maquina_params) do
      render(conn, "show.json", maquina: maquina)
    end
  end

  def delete(conn, %{"id" => id}) do
    maquina = Empresa.get_maquina!(id)
    with {:ok, %Maquina{}} <- Empresa.delete_maquina(maquina) do
      send_resp(conn, :no_content, "")
    end
  end
end
