defmodule JobBoard.PageController do
  use Phoenix.Controller
  alias JobBoard.Router

  def index(conn, _params) do
    jobs = JobBoard.Queries.jobs_query
    render conn, "index", jobs: jobs
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def save(conn, params) do
    job = %JobBoard.Jobs{title: params["title"], description: params["description"], job_type: params["type"], job_status: params["status"]}
    JobBoard.Repo.insert(job)
    redirect conn, Router.index_path(:index)
  end
end
