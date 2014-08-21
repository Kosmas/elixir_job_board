defmodule JobBoard.Queries do
  import Ecto.Query

  def jobs_query do
    query = from job in JobBoard.Jobs,
            select: job
    JobBoard.Repo.all(query)
  end
end