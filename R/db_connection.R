#' @title db_connection helper function
#'
#' @description Internal function to test and get the database connection of
#'   the target data system.
#'
#' @param headless A boolean (default: FALSE). Indicating, if the function is
#'   run only in the console (headless = TRUE) or on a GUI frontend
#'   (headless = FALSE).
#' @param timeout A timeout in sec. for the db-connection establishment.
#'   Values below 2 seconds are not recommended.
#'   Default is 30 seconds.
#' @param db_name A character. Name of the database system.
#' @param db_type A character. Type of the database system. Currently
#'   implemented systems are: 'postgres', 'oracle'.
#' @param lib_path A character string. The path to the ojdbc7.jar file.
#'
#' @inheritParams feedback
#'
#' @export
#'
# test db connection
db_connection <- function(db_name,
                          db_type,
                          headless = FALSE,
                          timeout = 30,
                          logfile_dir = NULL,
                          lib_path = NULL) {

  db_type <- toupper(db_type)
  db_name <- toupper(db_name)

  host <- Sys.getenv(
    paste0(db_name, "_HOST")
  )
  port <- Sys.getenv(
    paste0(db_name, "_PORT")
  )
  user <- Sys.getenv(
    paste0(db_name, "_USER")
  )
  password <- Sys.getenv(
    paste0(db_name, "_PASSWORD")
  )

  if (db_type == "ORACLE") {
    ## create driver
    drv <- RJDBC::JDBC(
      "oracle.jdbc.OracleDriver",
      classPath = paste0(
        lib_path, "/ojdbc7.jar"
      )
    )

    sid <- Sys.getenv(
      paste0(db_name, "_SID")
    )

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

    dbname <- Sys.getenv(
      paste0(db_name, "_DBNAME")
    )

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
    feedback("DB connection error",
             findme = "9431c8c61f",
             logfile_dir = logfile_dir,
             headless = headless)
  }
  return(db_con)
}
