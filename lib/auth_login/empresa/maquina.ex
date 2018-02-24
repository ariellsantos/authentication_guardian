defmodule AuthLogin.Empresa.Maquina do
  use Ecto.Schema
  import Ecto.Changeset
  alias AuthLogin.Empresa.Maquina


  schema "maquinas" do
    field :nombre, :string
    field :serial, :string

    timestamps()
  end

  @doc false
  def changeset(%Maquina{} = maquina, attrs) do
    maquina
    |> cast(attrs, [:nombre, :serial])
    |> validate_required([:nombre, :serial])
  end
end
