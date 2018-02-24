defmodule AuthLoginWeb.Auth.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :auth_login,
                              module: AuthLoginWeb.Auth.Guardian,
                              error_handler: AuthLoginWeb.Auth.AuthErrorHandler
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
end