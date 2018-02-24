defmodule AuthLoginWeb.Auth.Guardian do
  use Guardian, otp_app: :auth_login

  import Logger

  def subject_for_token(user, _claims) do
    Logger.info "#{Kernel.inspect user}"
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    Logger.info "#{Kernel.inspect claims}"
    user_id = claims["sub"]
    
    case  AuthLogin.Accounts.get_user!(user_id) do
      {:ok, user} ->
        Logger.info "#{Kernel.inspect user}"
        {:ok, user}

      {:error, _} -> 
        {:error, "non user"}
    end


    # If something goes wrong here return {:error, reason}
  end
end