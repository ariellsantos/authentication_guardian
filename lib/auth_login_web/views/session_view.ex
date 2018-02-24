defmodule AuthLoginWeb.SessionView do
  use AuthLoginWeb, :view
  alias AuthLoginWeb.SessionView

 
  
  def render("show.json", %{session: token}) do
    %{data: render_one(token, SessionView, "token.json")}
  end

  def render("token.json", %{session: token}) do
    %{
      token: token
    }
  end
end