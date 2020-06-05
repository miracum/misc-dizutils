#' @title query_database helper function
#'
#' @description Internal function to query the database. The function
#'   sends a sql statement to the database and returns a data.table.
#'
#' @param db_con A DBI database connection.
#' @param sql_statement A character string containing a valid SQL statement.
#' @return Returns the result of the db-query.
#' @examples
#' \dontrun{
#' db_con <- DIZutils::db_connection(
#'   db_name = "i2b2",
#'   db_type = "postgres"
#' )
#'
#' query_database(
#'   db_con = db_con,
#'   sql_statement = "SELECT * FROM table_name;"
#' )}
#'
#' @export
#'
# query_database
query_database <- function(db_con,
                           sql_statement) {

  stopifnot(!is.null(sql_statement), !is.null(db_con))
  # avoid sql-injection
  # https://db.rstudio.com/best-practices/run-queries-safely/
  sql <- DBI::sqlInterpolate(db_con, sql_statement)

  # return data as data.table
  outdat <-
    data.table::data.table(
      RPostgres::dbGetQuery(db_con, sql),
      stringsAsFactors = TRUE
    )
  return(outdat)
}
