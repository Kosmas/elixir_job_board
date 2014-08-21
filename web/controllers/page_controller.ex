defmodule JobBoard.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    jobs = JobBoard.Queries.jobs_query
    render conn, "index", jobs: jobs
  end
end
