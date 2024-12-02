Demo showing that 10k RPS with PostgreSQL is possible.

```console
$ docker compose up postgres -d
$ mix deps.get
$ MIX_ENV=bench mix run bench/postgres.exs
```

See Github Actions logs for results.
