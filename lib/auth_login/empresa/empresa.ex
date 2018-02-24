defmodule AuthLogin.Empresa do
  @moduledoc """
  The Empresa context.
  """

  import Ecto.Query, warn: false
  alias AuthLogin.Repo

  alias AuthLogin.Empresa.Maquina

  @doc """
  Returns the list of maquinas.

  ## Examples

      iex> list_maquinas()
      [%Maquina{}, ...]

  """
  def list_maquinas do
    Repo.all(Maquina)
  end

  @doc """
  Gets a single maquina.

  Raises `Ecto.NoResultsError` if the Maquina does not exist.

  ## Examples

      iex> get_maquina!(123)
      %Maquina{}

      iex> get_maquina!(456)
      ** (Ecto.NoResultsError)

  """
  def get_maquina!(id), do: Repo.get!(Maquina, id)

  @doc """
  Creates a maquina.

  ## Examples

      iex> create_maquina(%{field: value})
      {:ok, %Maquina{}}

      iex> create_maquina(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_maquina(attrs \\ %{}) do
    %Maquina{}
    |> Maquina.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a maquina.

  ## Examples

      iex> update_maquina(maquina, %{field: new_value})
      {:ok, %Maquina{}}

      iex> update_maquina(maquina, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_maquina(%Maquina{} = maquina, attrs) do
    maquina
    |> Maquina.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Maquina.

  ## Examples

      iex> delete_maquina(maquina)
      {:ok, %Maquina{}}

      iex> delete_maquina(maquina)
      {:error, %Ecto.Changeset{}}

  """
  def delete_maquina(%Maquina{} = maquina) do
    Repo.delete(maquina)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking maquina changes.

  ## Examples

      iex> change_maquina(maquina)
      %Ecto.Changeset{source: %Maquina{}}

  """
  def change_maquina(%Maquina{} = maquina) do
    Maquina.changeset(maquina, %{})
  end
end
