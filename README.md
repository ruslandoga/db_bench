Demo showing that 10k RPS with PostgreSQL is possible.

```sh
$ docker compose up postgres -d
$ mix deps.get
$ MIX_ENV=bench mix run bench/postgres.exs
```

See Github Actions [logs](https://github.com/ruslandoga/db_bench/actions/workflows/mix.yml) for results. Remeber to multiply `ips` by `parallel` to get approx total :)
