#' @title db_connection helper function
#'
#' @description Internal function to test and get the database connection of
#'   the target data system.
#'
#' @param headless A boolean (default: FALSE). Indicating, if the function is
#'   run only in the console (headless = TRUE) or on a GUI frontend
#'   (headless = FALSE).
#' @param from_env A boolean (default: TRUE). Should database connection
#'   be read from the environment or from a settings file.
#' @param settings A list. Required if `from_env=TRUE`. A list containing
#'   settings for the database connection. Required fields are 'host',
#'   'db_name', 'port', 'user' and 'password'.
#'   Additionally for Oracle DB's: 'sid'.
#' @param timeout A timeout in sec. for the db-connection establishment.
#'   Values below 2 seconds are not recommended.
#'   Default is 30 seconds.
#' @param db_name A character. Name of the database system.
#' @param db_type A character. Type of the database system. Currently
#'   implemented systems are: 'postgres', 'oracle'.
#' @param lib_path A character string. The path to the ojdbc*.jar file.
#'
#' @inheritParams feedback
#' @return If successful, the result will be the established connection.
#'   Otherwise the result will be null.
#' @examples
#' db_con <- DIZutils::db_connection(
#'   db_name = "i2b2",
#'   db_type = "postgres",
#'   headless = true,
#'   logfile_dir = "./path/to/logfile/dir/"
#' )
#'
#' @seealso \code{\link{DBI::dbConnect}}, \code{\link{RPostgres::dbConnect}}
#'
#' @export
#'
# test db connection
db_connection <- function(db_name,
                          db_type,
                          headless = FALSE,
                          from_env = TRUE,
                          settings = NULL,
                          timeout = 30,
                          logfile_dir = NULL,
                          lib_path = NULL) {
  stopifnot(
    is.character(db_name),
    is.character(db_type),
    is.logical(headless),
    is.logical(from_env),
    ifelse(is.null(settings), TRUE, is.list(settings)),
    is.numeric(timeout),
    ifelse(is.null(logfile_dir), TRUE, is.character(logfile_dir)),
    ifelse(is.null(lib_path), TRUE, is.character(lib_path))
  )

  db_type <- toupper(db_type)
  db_name <- toupper(db_name)

  if (isTRUE(from_env)) {
    dbname <- Sys.getenv(paste0(db_name, "_DBNAME"))
    host <- Sys.getenv(paste0(db_name, "_HOST"))
    port <- Sys.getenv(paste0(db_name, "_PORT"))
    user <- Sys.getenv(paste0(db_name, "_USER"))
    password <- Sys.getenv(paste0(db_name, "_PASSWORD"))

  } else if (isFALSE(from_env)) {
    stopifnot(
      is.list(settings),
      length(settings) >= 4
    )

    host <- settings$host
    port <- settings$port
    user <- settings$user
    password <- settings$password
  }

  if (db_type == "ORACLE") {
    ## create driver
    drv <- RJDBC::JDBC("oracle.jdbc.OracleDriver",
                       classPath = lib_path)

    if (isTRUE(from_env)) {
      sid <- Sys.getenv(paste0(db_name, "_SID"))
    } else if (isFALSE(from_env)) {
      sid <- settings$sid
    }

    ## create URL
    url <- paste0("jdbc:oracle:thin:@//", host, ":", port, "/", sid)

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
      conn <- NULL
      conn
    }, finally = function(f) {
      return(conn)
    })

  } else if (db_type == "POSTGRES") {
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
      conn <- NULL
      conn
    }, finally = function(f) {
      return(conn)
    })
  }
  if (is.null(db_con)) {
    feedback(
      "DB connection error",
      findme = "9431c8c61f",
      logfile_dir = logfile_dir,
      headless = headless
    )
  }
  return(db_con)
}
