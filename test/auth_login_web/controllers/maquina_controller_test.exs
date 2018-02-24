defmodule AuthLoginWeb.MaquinaControllerTest do
  use AuthLoginWeb.ConnCase

  alias AuthLogin.Empresa
  alias AuthLogin.Empresa.Maquina

  @create_attrs %{nombre: "some nombre", serial: "some serial"}
  @update_attrs %{nombre: "some updated nombre", serial: "some updated serial"}
  @invalid_attrs %{nombre: nil, serial: nil}

  def fixture(:maquina) do
    {:ok, maquina} = Empresa.create_maquina(@create_attrs)
    maquina
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all maquinas", %{conn: conn} do
      conn = get conn, maquina_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create maquina" do
    test "renders maquina when data is valid", %{conn: conn} do
      conn = post conn, maquina_path(conn, :create), maquina: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, maquina_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nombre" => "some nombre",
        "serial" => "some serial"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, maquina_path(conn, :create), maquina: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update maquina" do
    setup [:create_maquina]

    test "renders maquina when data is valid", %{conn: conn, maquina: %Maquina{id: id} = maquina} do
      conn = put conn, maquina_path(conn, :update, maquina), maquina: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, maquina_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nombre" => "some updated nombre",
        "serial" => "some updated serial"}
    end

    test "renders errors when data is invalid", %{conn: conn, maquina: maquina} do
      conn = put conn, maquina_path(conn, :update, maquina), maquina: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete maquina" do
    setup [:create_maquina]

    test "deletes chosen maquina", %{conn: conn, maquina: maquina} do
      conn = delete conn, maquina_path(conn, :delete, maquina)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, maquina_path(conn, :show, maquina)
      end
    end
  end

  defp create_maquina(_) do
    maquina = fixture(:maquina)
    {:ok, maquina: maquina}
  end
end
