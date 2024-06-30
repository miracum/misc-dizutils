# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2022 Universitätsklinikum Erlangen, Germany
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#' @title db_connection helper function
#'
#' @description Internal function to test and get the database connection of
#'   the target data system.
#'
#' @param headless A boolean (default: `FALSE`). Indicating, if the function is
#'   run only in the console (`headless = TRUE`) or on a GUI frontend
#'   (`headless = FALSE`).
#' @param from_env A boolean (default: `TRUE`). Should database connection
#'   be read from the environment or from a settings file. All necessary
#'   parameters must be uppercase and have the prefix of the db_name. E.g.:
#'   `I2B2_HOST` or `I2B2_PORT`. See the `settings` parameter for all
#'   necessary variables.
#' @param settings A list. Required if `from_env == FALSE`. A list containing
#'   settings for the database connection. Required fields are `host`,
#'   `db_name`, `port`, `user` and `password`.
#'   Additionally for Oracle DB's: `sid` (instead of `db_name`).
#'   If `settings` is set, `from_env` will be set to `FALSE` automatically.
#' @param timeout A timeout in sec. for the db-connection establishment.
#'   Values below 2 seconds are not recommended.
#'   Default is 30 seconds.
#' @param system_name (Default = NULL) A character. Name of the database system.
#'   Used to find the correct settings from the env. If you don't want to
#'   load the settings from the environment, use the `settings` parameter.
#'   Otherwise this funcion will search for all settings beginning with
#'   `system_name` in the environment. If `system_name = "i2b2"` settings like
#'   `I2B2_HOST` or `I2B2_PORT` (notice the uppercase) will be loaded from
#'   the environment. You can load such an env file e.g. by using
#'   `DIZtools::setenv_file(path_to_file)`.
#' @param db_type A character. Type of the database system. Currently
#'   implemented systems are: 'postgres', 'oracle'.
#' @param lib_path A character string. The path to the ojdbc*.jar file.
#'   If you run one of the R-containers from the UK-Erlangen DIZ, there
#'   might be a lib for oracle here: `lib_path = "/opt/libs/ojdbc8.jar"`
#' @param logfile_dir (Optional, String, default: "tempdir()")
#'   The absolute path to folder where the logfile will be stored.
#'
#' @return If successful, the result will be the established connection.
#'   Otherwise the result will be null.
#' @examples
#' \dontrun{
#' db_con <- DIZutils::db_connection(
#'   db_name = "i2b2",
#'   db_type = "postgres"
#' )}
#'
#' @seealso{
#' \code{\link[DBI]{dbConnect}}, \code{\link[RPostgres]{RPostgres}}
#' }
#'
#' @export
#'
db_connection <- function(system_name = NULL,
                          db_type,
                          headless = TRUE,
                          from_env = TRUE,
                          settings = NULL,
                          timeout = 30,
                          logfile_dir = NULL,
                          lib_path = NULL) {
  db_con <- NULL

  stopifnot(
    # is.character(system_name),
    is.character(db_type),
    is.logical(headless),
    is.logical(from_env),
    ifelse(is.null(settings), TRUE, is.list(settings)),
    is.numeric(timeout),
    ifelse(is.null(logfile_dir), TRUE, dir.exists(logfile_dir)),
    ifelse(is.null(lib_path), TRUE, file.exists(lib_path))
  )

  error <- FALSE

  tryCatch({
    ## If there are settings provided, use these and switch off `from_env`:
    if (isTRUE(!is.null(settings) && is.list(settings))) {
      from_env <- FALSE
    }

    if (isTRUE(from_env)) {
      stopifnot(is.character(system_name))
      system_name_uppercase <- toupper(system_name)
      settings <- load_settings_from_env(
        system_name_uppercase = system_name_uppercase
      )
    } else if (isFALSE(from_env)) {
      stopifnot(is.list(settings),
                length(settings) >= 4)
    }

    db_type <- toupper(db_type)

    necessary_vars <- c("host", "port", "user", "password")
    if (db_type != "ORACLE") {
      ## For oracle we don't need a 'dbname' but a SID, which
      ## will be checked later.
      necessary_vars <- c(necessary_vars, "dbname")
    }

    ## Check if all necessary parameters are filled:
    for (param in necessary_vars) {
      if (is.null(settings[[param]]) ||
          settings[[param]] == "") {
        DIZtools::feedback(
          print_this = paste0("Missing '", param, "' for db-connection."),
          type = "Error",
          findme = "f762a865c8",
          logfile_dir = logfile_dir,
          headless = headless
        )
        error <<- TRUE # @jonathan: why assignment of global variable?
      }
    }


    if (!error && db_type == "ORACLE") {
      if (is.null(lib_path)) {
        if (isTRUE(from_env)) {
          lib_path <- Sys.getenv(paste0(system_name_uppercase, "_DRIVER"))
        } else {
          lib_path <- settings$lib_path
        }
      }

      stopifnot(lib_path != "" || !is.null(lib_path))

      ## create driver
      drv <- RJDBC::JDBC("oracle.jdbc.OracleDriver",
                         classPath = lib_path)

      if (isTRUE(from_env)) {
        sid <- Sys.getenv(paste0(system_name_uppercase, "_SID"))
      } else if (isFALSE(from_env)) {
        sid <- settings$sid
      }

      if (is.null(sid) || sid == "") {
        ## SID is missing, so check if we can use the db_name instead:
        if (is.null(settings$dbname) || settings$dbname == "") {
          DIZtools::feedback(
            print_this = "Missing SID for db-connection to oracle.",
            type = "Error",
            findme = "0bba010a4a",
            logfile_dir = logfile_dir,
            headless = headless
          )
          error <<- TRUE
          stop()
        } else {
          DIZtools::feedback(
            print_this = paste0(
              "`SID` is empty. Using the `dbname` ('",
              settings$dbname,
              "') instead. But this might be wrong or cause errors!"
            ),
            type = "Warning",
            logfile_dir = logfile_dir,
            headless = headless,
            findme = "e38041e91c"
          )
          sid <- settings$dbname
        }
      }

      ## create URL
      url <- paste0(
          "jdbc:oracle:thin:@//",
          settings$host, ":",
          settings$port, "/",
          sid)

      ## create connection
      db_con <- tryCatch({
        conn <- DBI::dbConnect(
          drv = drv,
          url = url,
          user = settings$user,
          password = settings$password
        )
        conn
      }, error = function(e) {
        DIZtools::feedback(
          print_this = paste0("Error while connection to oracle: ", e),
          type = "Error",
          logfile_dir = logfile_dir,
          headless = headless,
          findme = "0a50850ccd"
        )
        error <<- TRUE # @jonathan: why assignment of global var?
        conn <- NULL
        return(conn)
      })
    } else if (!error && db_type == "POSTGRES") {
      drv <- RPostgres::Postgres()

      db_con <- tryCatch({
        # arguments from https://www.postgresql.org/docs/current/
        # libpq-connect.html#LIBPQ-PARAMKEYWORDS
        #
        # https://stackoverflow.com/questions/24130305/postgres-ssl-syscall-
        # error-eof-detected-with-python-and-psycopg

        conn <- RPostgres::dbConnect(
          drv = drv,
          dbname = settings$dbname,
          host = settings$host,
          port = settings$port,
          user = settings$user,
          password = settings$password,
          connect_timeout = timeout,
          keepalives = 1,
          keepalives_idle = 30,
          keepalives_interval = 5,
          keepalives_count = 5
        )
        if (!DIZtools::is.empty(settings$schema)) {
          # https://stackoverflow.com/questions/42139964/setting-the-schema-
          # name-in-postgres-using-r (NOTE: this is not working)
          # https://stackoverflow.com/questions/10032390/writing-to-specific-
          # schemas-with-rpostgresql
          if (settings$schema != "public") {
            DIZtools::feedback(
              print_this = paste0(
                "DB-connection using schema: '", settings$schema, "'"
              ),
              type = "Info",
              logfile_dir = logfile_dir,
              headless = headless,
              findme = "0a50610acd"
            )
            # https://stackoverflow.com/a/2875705
            search_path_sql <- paste0(
              "ALTER ROLE ", settings$user,  " ",
              "SET search_path = \"", settings$schema, "\", public;"
            )
            DIZtools::feedback(
              print_this = paste0(
                "Executing SQL on database:\n",
                search_path_sql
              ),
              type = "Info",
              logfile_dir = logfile_dir,
              headless = headless,
              findme = "0a10610acb"
            )
            RPostgres::dbSendQuery(
              conn = conn,
              statement = search_path_sql
            )
          } else {
            DIZtools::feedback(
              print_this = paste0(
                "DB schema = '", settings$schema, "'; skipping to set schema!"
              ),
              type = "Info",
              logfile_dir = logfile_dir,
              headless = headless,
              findme = "0a41520acf"
            )
          }
        }
        conn
      }, error = function(e) {
        DIZtools::feedback(
          print_this = paste0("Error while connection to postgres: ", e),
          type = "Error",
          logfile_dir = logfile_dir,
          headless = headless,
          findme = "0a50850ccd"
        )
        error <<- TRUE
        conn <- NULL
        return(conn)
      })
    }else if (!error && db_type == "PRESTO") {
      drv <- RPresto::Presto()

      db_con <- tryCatch({
        # arguments from https://rdrr.io/github/prestodb/RPresto/man/Presto.html

        #Alternativ aus trino_test.R
        httr::set_config(httr::config(
         ssl_verifypeer = 0L,
         userpwd = paste(Sys.getenv("TRINO_USER"), Sys.getenv("TRINO_PASSWORD"), sep = ":")
        ))

        #conn <- RPresto::src_presto(
        # host = "https://trino.diz.uk-erlangen.de", #"https://trino-qs.diz.uk-erlangen.de",
        # port = 443,
        # catalog = "catalog",
        # session.timezone = "Europe/Berlin"
        #)
        #Alternativ Ende
        conn <- DBI::dbConnect(
          drv = RPresto::Presto(),
          host =  "https://trino.diz.uk-erlangen.de",
          port = 443,
          user = Sys.getenv("TRINO_USER"),
          password = Sys.getenv("TRINO_PASSWORD"),
          catalog = "memory",
          schema = "default"
        )
      })

      if (!DIZtools::is.empty(settings$schema)) {
        # https://stackoverflow.com/questions/42139964/setting-the-schema-
        # name-in-postgres-using-r (NOTE: this is not working)
        # https://stackoverflow.com/questions/10032390/writing-to-specific-
        # schemas-with-rpostgresql
        if (settings$schema != "public") {
          DIZtools::feedback(
            print_this = paste0(
              "DB-connection using schema: '", settings$schema, "'"
            ),
            type = "Info",
            logfile_dir = logfile_dir,
            headless = headless,
            findme = "0a50610acd" # TODO: Anpassen?
          )
          # https://stackoverflow.com/a/2875705
          #search_path_sql <- paste0(
          #  "ALTER ROLE ", settings$user,  " ",
          #  "SET search_path = \"", settings$schema, "\", public;"
          #)
          search_path_sql <- "SELECT distinct gender FROM fhir.qs.patient" 
          DIZtools::feedback(
            print_this = paste0(
              "Executing SQL on database:\n",
              search_path_sql
            ),
            type = "Info",
            logfile_dir = logfile_dir,
            headless = headless,
            findme = "0a10610acb"
          )

          #data <- dplyr::tbl(conn, dplyr::sql(search_path_sql)) |> data.table::as.data.table()
          data <- DBI::dbGetQuery(conn, search_path_sql) 
        } else {
          DIZtools::feedback(
            print_this = paste0(
              "DB schema = '", settings$schema, "'; skipping to set schema!"
            ),
            type = "Info",
            logfile_dir = logfile_dir,
            headless = headless,
            findme = "0a41520acf"
          )
        }
      }
      conn
    }
    if (error || is.null(db_con)) {
      DIZtools::feedback(
        "DB connection error",
        findme = "9431c8c61f",
        logfile_dir = logfile_dir,
        headless = headless,
        type = "Error"
      )
      error <- TRUE
    }
  },
  error = function(cond) {
    DIZtools::feedback(
      print_this = paste0("Error while trying to establish a db-connection: ",
                          cond),
      type = "Error",
      logfile_dir = logfile_dir,
      headless = headless,
      findme = "c16b60a6ff"
    )
    return(NULL)
  })
  if (error) {
    DIZtools::feedback(
      print_this = paste0(
        "Error while trying to establish the db conncection.",
        " Maybe the logging above is helpful for debugging?"
      ),
      type = "Error",
      findme = "29294c19e3",
      logfile_dir = logfile_dir,
      headless = headless
    )
  }
  return(db_con)
}


load_settings_from_env <- function(system_name_uppercase) {

  settings <- list()

  settings$dbname <- Sys.getenv(paste0(system_name_uppercase, "_DBNAME"))
  settings$host <- Sys.getenv(paste0(system_name_uppercase, "_HOST"))
  settings$port <- Sys.getenv(paste0(system_name_uppercase, "_PORT"))
  settings$user <- Sys.getenv(paste0(system_name_uppercase, "_USER"))
  settings$password <- Sys.getenv(paste0(system_name_uppercase, "_PASSWORD"))
  settings$schema <- Sys.getenv(paste0(system_name_uppercase, "_SCHEMA"))

  return(settings)
}
