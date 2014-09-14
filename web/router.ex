defmodule JobBoard.Router do
  use Phoenix.Router

#  plug Plug.Static, at: "/static", from: :job_board
#  get "/", JobBoard.PageController, :index, as: :pages
#  get "/new", JobBoard.PageController, :new, as: :new
#  post "/new", JobBoard.PageController, :save, as: :save
#  get "/job/:id", JobBoard.PageController, :job, as: :job
#  get "/job/:id/edit", JobBoard.PageController, :edit, as: :edit
#  post "/job/:id", JobBoard.PageController, :update, as: :update
#  get "/job/:id/:action", JobBoard.PageController, :job, as: :delete
#  post "/", JobBoard.PageController, :destroy, as: :destroy

  scope alias: JobBoard do
    get "/", PagesController, :index, as: :index
    resources "jobs", JobBoardController
  end
end
