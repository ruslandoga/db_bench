defmodule App do
  @moduledoc """
  Documentation for `App`.
  """

  # https://pgtune.leopard.in.ua/
  def pgtune(conn) do
    cmds = [
      "ALTER SYSTEM SET max_connections = '100'",
      "ALTER SYSTEM SET shared_buffers = '3840MB'",
      "ALTER SYSTEM SET effective_cache_size = '11520MB'",
      "ALTER SYSTEM SET maintenance_work_mem = '960MB'",
      "ALTER SYSTEM SET checkpoint_completion_target = '0.9'",
      "ALTER SYSTEM SET wal_buffers = '16MB'",
      "ALTER SYSTEM SET default_statistics_target = '100'",
      "ALTER SYSTEM SET random_page_cost = '1.1'",
      "ALTER SYSTEM SET effective_io_concurrency = '200'",
      "ALTER SYSTEM SET work_mem = '19660kB'",
      "ALTER SYSTEM SET huge_pages = 'off'",
      "ALTER SYSTEM SET min_wal_size = '1GB'",
      "ALTER SYSTEM SET max_wal_size = '4GB'",
      "ALTER SYSTEM SET max_worker_processes = '4'",
      "ALTER SYSTEM SET max_parallel_workers_per_gather = '2'",
      "ALTER SYSTEM SET max_parallel_workers = '4'",
      "ALTER SYSTEM SET max_parallel_maintenance_workers = '2'"
    ]

    Enum.each(cmds, fn cmd ->
      Postgrex.query!(conn, cmd, [], [])
    end)
  end
end
