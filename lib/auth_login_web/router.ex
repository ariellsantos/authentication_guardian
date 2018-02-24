defmodule AuthLoginWeb.Router do
  use AuthLoginWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug AuthLoginWeb.Auth.AuthPipeline
  end

  scope "/api", AuthLoginWeb do
    pipe_through :api
    post "session/sing_in", SessionController, :create
    resources "/users", UserController, only: [:create]
  end

  scope "/api", AuthLoginWeb do
    pipe_through [:api, :api_auth]
    resources "/maquinas", MaquinaController
  end
end
