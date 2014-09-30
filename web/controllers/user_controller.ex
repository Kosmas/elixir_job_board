defmodule JobBoard.UserController do
  use Phoenix.Controller
  alias JobBoard.Router

  def new(conn, _params) do
    render conn, "new"
  end
end
