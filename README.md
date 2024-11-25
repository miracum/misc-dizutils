

# DIZutils <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

    Warning: `git_branch_default()` was deprecated in usethis 2.1.0.
    ℹ Please use `git_default_branch()` instead.
    ℹ The deprecated feature was likely used in the badger package.
      Please report the issue at <https://github.com/GuangchuangYu/badger/issues>.

[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![](https://www.r-pkg.org/badges/version/DIZutils)](https://cran.r-project.org/package=DIZutils)
[![CRAN
checks](https://badges.cranchecks.info/worst/DIZutils.svg)](https://cran.r-project.org/web/checks/check_results_DIZutils.html)
[![](http://cranlogs.r-pkg.org/badges/grand-total/DIZutils?color=blue)](https://cran.r-project.org/package=DIZutils)
[![](http://cranlogs.r-pkg.org/badges/last-month/DIZutils?color=blue)](https://cran.r-project.org/package=DIZutils)
[![Dependencies](https://tinyverse.netlify.app/badge/DIZutils)](https://cran.r-project.org/package=DIZutils)
[![R build
status](https://github.com/miracum/misc-dizutils/workflows/R%20CMD%20Check%20via%20%7Btic%7D/badge.svg)](https://github.com/miracum/misc-dizutils/actions)
[![R build
status](https://github.com/miracum/misc-dizutils/workflows/lint/badge.svg)](https://github.com/miracum/misc-dizutils/actions)
[![R build
status](https://github.com/miracum/misc-dizutils/workflows/test-coverage/badge.svg)](https://github.com/miracum/misc-dizutils/actions)
[![](https://app.codecov.io/gh/https://github.com/miracum/misc-dizutils/branch/master/graph/badge.svg)](https://app.app.codecov.io/gh/https://github.com/miracum/misc-dizutils)

<!-- badges: end -->

The R package `DIZutils` provides utility functions used for the R
package development infrastructure inside the data integration centers
(‘DIZ’) to standardize and facilitate repetitive tasks such as setting
up a database connection or issuing notification messages and to avoid
redundancy.

## Installation

You can install `DIZutils` directly from CRAN:

``` r
install.packages("DIZutils")
```

The development version can be installed using

``` r
install.packages("remotes")
remotes::install_github("miracum/misc-dizutils", ref = "development")
```

## Basic functions

### db_connection

The function `DIZutils::db_connection` provides one simple interface for
connecting to various types of databases. It reads necessary connection
settings from the active environment (see below how to use the function
`set_env_vars` to set environment variables).

The following database types are currently supported:

- postgres (via the R package
  [`RPostgres`](https://CRAN.R-project.org/package=RPostgres))
- oracle (via the R packages
  [`RJDBC`](https://CRAN.R-project.org/package=RJDBC) and
  [`DBI`](https://CRAN.R-project.org/package=DBI/))

#### postgres

The following environment variables need to be set to the active
environment in order to connect with a postgres database with “i2b2” as
name of the database to connect with:

| Variable | Description |
|----|----|
| I2B2_HOST | The hostname/ IP address of your pg instance. |
| I2B2_DBNAME | The name of the pg-database. |
| I2B2_PORT | The port, your pg postgres instance is running on. |
| I2B2_USER | The name of the ‘I2B2_USER’. |
| I2B2_PASSWORD | The password of the ‘I2B2_USER’ of your pg instance. |
| I2B2_SCHEMA | (optional) The database schema on which queries should be performed. |

To establish the connection, please set those environment variables
accordingly and execute the following command. The argument `db_name` is
used to detect the corresponding environment variables and thus must
match with the environment variables’ prefix.

``` r
db_con <- DIZutils::db_connection(
    system_name = "i2b2",
    db_type = "postgres"
  )
```

#### oracle

The following environment variables need to be set to the active
environment in order to connect with an oracle database:

| Variable | Description |
|----|----|
| MYORACLEDB_HOST | The hostname/ IP address of your oracle instance. |
| MYORACLEDB_DBNAME | The name of the oracle-database. |
| MYORACLEDB_DRIVER | The path to the oracle jdbc driver. |
| MYORACLEDB_SID | The SID of the oracle-database. |
| MYORACLEDB_PORT | The port, your oracle postgres instance is running on. |
| MYORACLEDB_USER | The name of the ‘MYORACLEDB_USER’. |
| MYORACLEDB_PASSWORD | The password of the ‘MYORACLEDB_USER’ of your oracle instance. |

To establish the connection, please set those environment variables
accordingly and execute the following command. The argument `db_name` is
used to detect the corresponding environment variables and thus must
match with the environment variables’ prefix. Furthermore, an
ojdbc\*.jar-file needs to be provided via the function’s `lib_path`
argument.

``` r
db_con <- DIZutils::db_connection(
  system_name = "myoracledb",
  db_type = "oracle",
  lib_path = "path/to/ojdbc*.jar"
)
```

For further details on how to set the specific environment variables
using a configuration file, please refer to the documentation in the
[`DIZtools`](https://github.com/miracum/misc-diztools#setenv_file) R
package.

## More Infos

- about MIRACUM: <https://www.miracum.org/>
- about the Medical Informatics Initiative:
  <https://www.medizininformatik-initiative.de/en/start>
