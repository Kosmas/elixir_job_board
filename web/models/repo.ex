defmodule PhoenixJobs.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://pguser:rtwe34@localhost/job_board"
  end

  def priv do
    app_dir(:job_board, "priv/repo")
  end
end
