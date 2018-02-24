defmodule AuthLogin.EmpresaTest do
  use AuthLogin.DataCase

  alias AuthLogin.Empresa

  describe "maquinas" do
    alias AuthLogin.Empresa.Maquina

    @valid_attrs %{nombre: "some nombre", serial: "some serial"}
    @update_attrs %{nombre: "some updated nombre", serial: "some updated serial"}
    @invalid_attrs %{nombre: nil, serial: nil}

    def maquina_fixture(attrs \\ %{}) do
      {:ok, maquina} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Empresa.create_maquina()

      maquina
    end

    test "list_maquinas/0 returns all maquinas" do
      maquina = maquina_fixture()
      assert Empresa.list_maquinas() == [maquina]
    end

    test "get_maquina!/1 returns the maquina with given id" do
      maquina = maquina_fixture()
      assert Empresa.get_maquina!(maquina.id) == maquina
    end

    test "create_maquina/1 with valid data creates a maquina" do
      assert {:ok, %Maquina{} = maquina} = Empresa.create_maquina(@valid_attrs)
      assert maquina.nombre == "some nombre"
      assert maquina.serial == "some serial"
    end

    test "create_maquina/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Empresa.create_maquina(@invalid_attrs)
    end

    test "update_maquina/2 with valid data updates the maquina" do
      maquina = maquina_fixture()
      assert {:ok, maquina} = Empresa.update_maquina(maquina, @update_attrs)
      assert %Maquina{} = maquina
      assert maquina.nombre == "some updated nombre"
      assert maquina.serial == "some updated serial"
    end

    test "update_maquina/2 with invalid data returns error changeset" do
      maquina = maquina_fixture()
      assert {:error, %Ecto.Changeset{}} = Empresa.update_maquina(maquina, @invalid_attrs)
      assert maquina == Empresa.get_maquina!(maquina.id)
    end

    test "delete_maquina/1 deletes the maquina" do
      maquina = maquina_fixture()
      assert {:ok, %Maquina{}} = Empresa.delete_maquina(maquina)
      assert_raise Ecto.NoResultsError, fn -> Empresa.get_maquina!(maquina.id) end
    end

    test "change_maquina/1 returns a maquina changeset" do
      maquina = maquina_fixture()
      assert %Ecto.Changeset{} = Empresa.change_maquina(maquina)
    end
  end
end
