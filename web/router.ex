defmodule JobBoard.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :job_board
  get "/", JobBoard.PageController, :index, as: :index
  get "/new", JobBoard.PageController, :new, as: :new
  post "/new", JobBoard.PageController, :save, as: :save
  get "/job/:id", JobBoard.PageController, :job, as: :job
  get "/job/:id/edit", JobBoard.PageController, :edit, as: :edit
  post "/job/:id", JobBoard.PageController, :update, as: :update
end
