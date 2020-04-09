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
#' @param db_name A character. Name of the database system. Currently
#'   implemented systems are: 'postgres', 'oracle'.
#'
#' @inheritParams dqa
#'
#' @export
#'
# test db connection
db_connection <- function(db_name,
                          headless = FALSE,
                          timeout = 30,
                          logfile_dir = NULL) {

  drv <- RPostgres::Postgres()

  db_con <- tryCatch({
    db_con <- RPostgres::dbConnect(
      drv = drv,
      dbname = settings$dbname,
      host = settings$host,
      port = settings$port,
      user = settings$user,
      password = settings$password,
      connect_timeout = timeout
    )
    db_con
  }, error = function(e) {
    db_con <- NULL
    db_con
  }, finally = function(f) {
    return(db_con)
  })

  if (is.null(db_con)) {
    feedback("DB connection error",
             findme = "9431c8c61f",
             logfile_dir = logfile_dir,
             headless = headless)
  }
  return(db_con)
}
