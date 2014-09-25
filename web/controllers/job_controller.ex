defmodule JobBoard.JobController do
  use Phoenix.Controller
  alias JobBoard.Router

  def index(conn, _params) do
    jobs = JobBoard.Queries.jobs_query
    render conn, "index", jobs: jobs
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params) do
    job = %JobBoard.Jobs{title: params["title"], description: params["description"], job_type: params["type"], job_status: params["status"]}
    JobBoard.Repo.insert(job)
    redirect conn, Router.pages_path(:index)
  end

  def show(conn, params) do
    job = JobBoard.Queries.job_detail_query(params["id"])
    render conn, "job", [job: job, action: params["action"]]
  end

  def edit(conn, %{"id" => id}) do
    job = JobBoard.Queries.job_detail_query(id)
    render conn, "edit", jbo: job
  end

  def update(conn, params) do
    IO.inspect params["type"]
    job = JobBoard.Repo.get(JobBoard.Jobs, params["id"])
    job = %{job | title: params["title"], description: params["description"], job_type: params["type"], jbb_status: params["status"]}
    JobBoard.Repo.update(job)
    redirect conn, Router.pages_path(:index)
  end

  def destroy(conn, params) do
    job = JobBoard.Queries.job_detail_query(params["id"])
    JobBoard.Repo.delete(job)
    redirect conn, Router.pages_path(:index)
  end
end
