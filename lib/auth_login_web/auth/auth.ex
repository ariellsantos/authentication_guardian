defmodule AuthLoginWeb.Auth.Auth do
  alias AuthLogin.Accounts
  alias AuthLogin.Repo

  def authenticate_user(username, password) do
    Accounts.find_by_username(username)
    |> Repo.one()
    |> check_password(password)
  end
  
  defp check_password(nil, _), do: {:error, "Incorrect username or password"}
  
  defp check_password(user, password) do
    case Comeonin.Pbkdf2.checkpw(password, user.password_hash) do
      true -> 
        {:ok, user}
      false -> 
        :error
    end
  end
end