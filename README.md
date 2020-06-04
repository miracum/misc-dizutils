# DIZutils (!!!under development!!!)

<!-- badges: start -->
[![pipeline status](https://gitlab.miracum.org/miracum/dqa/dizutils/badges/master/pipeline.svg)](https://gitlab.miracum.org/miracum/dqa/dizutils/commits/master)
[![coverage report](https://gitlab.miracum.org/miracum/dqa/dizutils/badges/master/coverage.svg)](https://gitlab.miracum.org/miracum/dqa/dizutils/commits/master)
<!-- badges: end -->

The R package `DIZutils` provides utility functions used for the R package development infrastructure inside the data integration centers ('DIZ'), to standardize and facilitate repetitive tasks such as setting up a database connection or issuing notification messages and to avoid redundancy.

# Installation

```r
install.packages("DIZutils")
```

The development version can be installed using

```r
install.packages("devtools")
devtools::install_github("miracum/misc-dizutils", ref = "development")
```

# Basic functions 

## db_connection

The function `DIZutils::db_connection` provides one simple interface for connecting to various types of databases. It reads neccessary connection settings from the active environment (see below how to use the function `set_env_vars` to set environment variables). 

The following database types are currently supported: 
* postgres (via the R package [`RPostgres`](https://cran.r-project.org/web/packages/RPostgres/index.html)) 
* oracle (via the R packages [`RJDBC::JDBC`](https://cran.r-project.org/web/packages/RJDBC/) and [`DBI`](https://cran.r-project.org/web/packages/DBI/))

### postgres

The following environment variables need to be set to the active environment in order to connect with a postgres database with "i2b2" as name of the database to connect with: 

| Variable          | Description                                                               |
| ----------------- | ------------------------------------------------------------------------- |
| I2B2_HOST         | The hostname/ IP address of your pg instance.                             |
| I2B2_DBNAME       | The name of the pg-database.                                              |
| I2B2_PORT         | The port, your pg postgres instance is running on.                        |
| I2B2_USER         | The name of the 'I2B2_USER'.                                              |
| I2B2_PASSWORD     | The password of the 'I2B2_USER' of your pg instance.                      |

To establish the connection, please set those environment variables accordingly and execute the following command. The argument `db_name` is used to detect the corresponding environment variables and thus must match with the environment variables' prefix. 

```r
db_con <- DIZutils::db_connection(
  db_name = "i2b2",
  db_type = "postgres"
)
```

### oracle

The following environment variables need to be set to the active environment in order to connect with an oracle database:

| Variable          | Description                                                               |
| ----------------- | ------------------------------------------------------------------------- |
| MYORACLEDB_HOST         | The hostname/ IP address of your oracle instance.                   |
| MYORACLEDB_DBNAME       | The name of the oracle-database.                                    |
| MYORACLEDB_PORT         | The port, your oracle postgres instance is running on.              |
| MYORACLEDB_USER         | The name of the 'MYORACLEDB_USER'.                                  |
| MYORACLEDB_PASSWORD     | The password of the 'MYORACLEDB_USER' of your oracle instance.      |

To establish the connection, please set those environment variables accordingly and execute the following command. The argument `db_name` is used to detect the corresponding enviroment variables and thus must match with the environment variables' prefix. Furthermore, an ojdbc*.jar-file needs to be provided via the function's `lib_path` argument.

```r
db_con <- DIZutils::db_connection(
  db_name = "myoracledb",
  db_type = "oracle",
  lib_path = "path/to/ojdbc*.jar"
)
```

## set_env_vars

In order to set up a database connection using the function `DIZutils::db_connection`, one needs to provide the required connection settings via environment variables. To facilitate the process of making such environment variables available within the current R session, the function `DIZutils::set_env_vars` works as a wrapper function around the base R method `Sys.setenv`. It takes the file name of a text file with the definitions of the environment variables as input, and sets those environment variables within the current R session.

```r
DIZutils::set_env_vars("path/to/envfile")
```

The design of the `envfile` is based on the [`.env` file for defining environment variables when using docker-compose commands](https://docs.docker.com/compose/env-file/) (currently, neither empty lines nor the using of comments ('#') is being supporte by `DIZutils::set_env_vars`). 

To create an `envfile` for connecting with an i2b2 database, the following examplary definitions of environment variables should be written to a simple textfile, e.g. named `envfile`, which can then be passed as argument to `DIZutils::set_env_vars`.

```
I2B2_HOST=123.45.56.8
I2B2_PORT=5432
I2B2_DBNAME=i2b2
I2B2_USER=user
I2B2_PASSWORD=password
```


# More Infos

- about MIRACUM: [https://www.miracum.org/](https://www.miracum.org/)
- about the Medical Informatics Initiative: [https://www.medizininformatik-initiative.de/index.php/de](https://www.medizininformatik-initiative.de/index.php/de)
