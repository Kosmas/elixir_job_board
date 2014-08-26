defmodule JobBoard.Queries do
  import Ecto.Query

  def jobs_query do
    query = from job in JobBoard.Jobs,
            order_by: [desc: job.id],
            select: job
    JobBoard.Repo.all(query)
  end

  def job_detail_query(id) do
    int_id = String.to_integer(id)
    query = from job in JobBoard.Jobs,
            where: job.id == ^int_id,
            select: job
    JobBoard.Repo.all(query) |> List.first
  end
end
