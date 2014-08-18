defmodule JobBoard.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :job_board
  get "/", JobBoard.PageController, :index, as: :page
end
