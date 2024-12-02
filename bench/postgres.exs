{:ok, pool} =
  Postgrex.start_link(
    database: "postgres",
    hostname: "localhost",
    username: "postgres",
    password: "postgres",
    pool_size: 10
  )

Benchee.run(
  %{
    "Postgrex.query!/4" => fn input ->
      %{query: query, params: params, opts: opts} = input
      Postgrex.query!(pool, query, params, opts)
    end
  },
  parallel: 10,
  inputs: %{
    "select 1" => %{
      query: "select 1",
      params: [],
      opts: []
    }
  }
)
