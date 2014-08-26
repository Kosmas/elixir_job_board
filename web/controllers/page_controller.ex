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

  def job(conn, params) do
    job = JobBoard.Queries.job_detail_query(params["id"])
    render conn, "job", [job: job, action: params["action"]]
  end

  def edit(conn, %{"id" => id}) do
    job = JobBoard.Queries.job_detail_query(id)
    render conn, "edit", job:  job
  end

  def update(conn, params) do
    IO.inspect params["type"]
    job = JobBoard.Queries.job_detail_query(params["id"])
    job = %{job | title: params["title"], description: params["description"],
                  job_type: params["type"], job_status: params["status"]}
    JobBoard.Repo.update(job)
    redirect conn, Router.index_path(:index)
  end

  def destroy(conn, params) do
    job = JobBoard.Queries.job_detail_query(params["id"])
    JobBoard.Repo.delete(job)
    redirect conn, Router.index_path(:index)
  end
end
