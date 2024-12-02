{:ok, pool} =
  Postgrex.start_link(
    database: "postgres",
    hostname: "localhost",
    username: "postgres",
    password: "postgres",
    pool_size: 100,
    after_connect: &App.pgtune/1
  )

Benchee.run(
  %{
    "Postgrex.query!/4" => fn input ->
      %{query: query, params: params, opts: opts} = input
      Postgrex.query!(pool, query, params, opts)
    end
  },
  parallel: 100,
  inputs: %{
    "select 1" => %{
      query: "select 1",
      params: [],
      opts: []
    }
  }
)
