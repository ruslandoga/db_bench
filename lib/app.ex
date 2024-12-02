defmodule App do
  @moduledoc """
  Documentation for `App`.
  """

  # based on https://pgtune.leopard.in.ua/
  def pgtune(conn) do
    workers = System.schedulers_online()

    cmds = [
      "ALTER SYSTEM SET max_connections = '100'",
      "ALTER SYSTEM SET checkpoint_completion_target = '0.9'",
      "ALTER SYSTEM SET default_statistics_target = '100'",
      "ALTER SYSTEM SET random_page_cost = '1.1'",
      "ALTER SYSTEM SET effective_io_concurrency = '200'",
      "ALTER SYSTEM SET huge_pages = 'off'",
      "ALTER SYSTEM SET max_worker_processes = '#{workers}'",
      "ALTER SYSTEM SET max_parallel_workers_per_gather = '#{max(div(workers, 2), 1)}'",
      "ALTER SYSTEM SET max_parallel_workers = '#{workers}'",
      "ALTER SYSTEM SET max_parallel_maintenance_workers = '#{max(div(workers, 2), 1)}'"
    ]

    Enum.each(cmds, fn cmd ->
      Postgrex.query!(conn, cmd, [], [])
    end)
  end
end
