defmodule AuthLoginWeb.SessionController do
  use AuthLoginWeb, :controller
  alias AuthLoginWeb.Auth.Auth

  def create(conn, %{"username" => username, "password" => password }) do
    case Auth.authenticate_user(username, password) do
      {:ok, user} ->
        {:ok, token, _} = AuthLoginWeb.Auth.Guardian.encode_and_sign(user)
        conn
        |> put_status(:ok)
        render conn, "show.json", session: token
      :error -> 
        conn
        |> put_status(:unauthorized)
        render conn, "401.json"
    end

  end
end