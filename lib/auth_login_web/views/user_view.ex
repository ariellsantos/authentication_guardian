defmodule AuthLoginWeb.UserView do
  use AuthLoginWeb , :view 
  alias AuthLoginWeb.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json", user)}
  end

  def render("user.json", %{user: user}) do
    %{
      username: user.username,
      email: user.email
    }
  end
end