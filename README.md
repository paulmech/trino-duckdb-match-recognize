# Use Trino and DuckDB for testing SQL MATCH_RECOGNIZE clause

This repository is a simple and free way to be able to practice using the SQL `MATCH_RECOGNIZE` clause,
which for the most part is only available in commercial products, or in systems like Flink that have 
quite complex setup requirements.

For more details see [Uncovering Event Patterns in SQL with Match_Recognize](https://www.tind.au/blog/match-recognize-with-trino/)

## Requirements

- docker
- duckdb
- date (coreutils)
- curl
- internet connection to download data files initially

## Get Started

Run the `start.sh` script to get started

```
$ ./start.sh
```

It will:

- download 6 months of data
- create a new duckdb database
- start the Trino container using docker compose

Once data has been downloaded, it will not be re-downloaded again unless you remove files from the `data/downloaded/` directory

## Connect to Trino

I use [DBeaver CE](https://dbeaver.io/download/) to connect to Trino.

You will find the `fuelwatch` table within the duckdb/main schema.
