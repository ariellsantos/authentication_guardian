defmodule AuthLoginWeb.UserController do
  use AuthLoginWeb, :controller
  alias AuthLogin.Accounts
  alias AuthLogin.Accounts.User
  
  action_fallback AuthLoginWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      render conn, "show.json", user: user
    end
  end
end