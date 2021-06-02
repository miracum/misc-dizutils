# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2021 Universitätsklinikum Erlangen, Germany
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
#'   `DIZutils::set_env_vars(path_to_file)`.
#' @param db_type A character. Type of the database system. Currently
#'   implemented systems are: 'postgres', 'oracle'.
#' @param lib_path A character string. The path to the ojdbc*.jar file.
#'   If you run one of the R-containers from the UK-Erlangen DIZ, there
#'   might be a lib for oracle here: `lib_path = "/opt/libs/ojdbc8.jar"`
#'
#' @inheritParams feedback
#' @return If successful, the result will be the established connection.
#'   Otherwise the result will be null.
#' @examples
#' \dontrun{
#' db_con <- DIZutils::db_connection(
#'   db_name = "i2b2",
#'   db_type = "postgres",
#'   headless = TRUE,
#'   logfile_dir = tempdir()
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
                          headless = FALSE,
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
      dbname <- Sys.getenv(paste0(system_name_uppercase, "_DBNAME"))
      host <- Sys.getenv(paste0(system_name_uppercase, "_HOST"))
      port <- Sys.getenv(paste0(system_name_uppercase, "_PORT"))
      user <- Sys.getenv(paste0(system_name_uppercase, "_USER"))
      password <- Sys.getenv(paste0(system_name_uppercase, "_PASSWORD"))
    } else if (isFALSE(from_env)) {
      stopifnot(is.list(settings),
                length(settings) >= 4)
      dbname <- settings$dbname
      host <- settings$host
      port <- settings$port
      user <- settings$user
      password <- settings$password
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
      if (!exists(param) ||
          get(param) == "" || is.null(get(param))) {
        feedback(
          print_this = paste0("Missing '", param, "' for db-connection."),
          type = "Error",
          findme = "f762a865c8",
          logfile_dir = logfile_dir,
          headless = headless
        )
        error <<- TRUE
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
        if (is.null(dbname) || dbname == "") {
          feedback(
            print_this = "Missing SID for db-connection to oracle.",
            type = "Error",
            findme = "0bba010a4a",
            logfile_dir = logfile_dir,
            headless = headless
          )
          error <<- TRUE
          stop()
        } else {
          feedback(
            print_this = paste0(
              "`SID` is empty. Using the `dbname` ('",
              dbname,
              "') instead. But this might be wrong or cause errors!"
            ),
            type = "Warning",
            logfile_dir = logfile_dir,
            headless = headless,
            findme = "e38041e91c"
          )
          sid <- dbname
        }
      }

      ## create URL
      url <-
        paste0("jdbc:oracle:thin:@//", host, ":", port, "/", sid)

      ## create connection
      db_con <- tryCatch({
        conn <- DBI::dbConnect(
          drv = drv,
          url = url,
          user = user,
          password = password
        )
        conn
      }, error = function(e) {
        feedback(
          print_this = paste0("Error while connection to oracle: ", e),
          type = "Error",
          logfile_dir = logfile_dir,
          headless = headless,
          findme = "0a50850ccd"
        )
        error <<- TRUE
        conn <- NULL
        return(conn)
      })
    } else if (!error && db_type == "POSTGRES") {
      drv <- RPostgres::Postgres()

      db_con <- tryCatch({
        conn <- RPostgres::dbConnect(
          drv = drv,
          dbname = dbname,
          host = host,
          port = port,
          user = user,
          password = password,
          connect_timeout = timeout
        )
        conn
      }, error = function(e) {
        feedback(
          print_this = paste0("Error while connection to postgres: ", e),
          type = "Error",
          logfile_dir = logfile_dir,
          headless = headless,
          findme = "0a50850ccd"
        )
        error <- TRUE
        conn <- NULL
        conn
      }, finally = function(f) {
        return(conn)
      })
    }
    if (error || is.null(db_con)) {
      feedback(
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
    feedback(
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
    DIZutils::feedback(
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
