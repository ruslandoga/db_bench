parallel = 100

{:ok, pool} =
  Postgrex.start_link(
    database: "postgres",
    hostname: "localhost",
    username: "postgres",
    password: "postgres",
    pool_size: parallel
  )

App.pgtune(pool)

Benchee.run(
  %{
    "Postgrex.query!/4" => fn input ->
      %{query: query, params: params, opts: opts} = input
      Postgrex.query!(pool, query, params, opts)
    end
  },
  parallel: parallel,
  inputs: %{
    "select 1" => %{
      query: "select 1",
      params: [],
      opts: []
    }
  }
)
