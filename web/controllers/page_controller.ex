defmodule JobBoard.PageController do
  use Phoenix.Controller
  alias JobBoard.Router
  alias JobBoard.Queries

  def index(conn, _params) do
    jobs = Queries.jobs_query
    render conn, "index", jobs: jobs
  end
end
