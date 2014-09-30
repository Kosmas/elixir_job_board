defmodule JobBoard.Router do
  use Phoenix.Router

  scope alias: JobBoard do
    get "/", PageController, :index, as: :pages
    resources "/jobs", JobController

    get "/users/new", UserController, :new, as: :user
  end
end
