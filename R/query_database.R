# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2021 Universitätsklinikum Erlangen
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

#' @title query_database helper function
#'
#' @description Internal function to query the database. The function
#'   sends a sql statement to the database and returns a data.table.
#'
#' @param db_con A DBI database connection.
#' @param sql_statement A character string containing a valid SQL statement.
#'   Caution: Everything after the first ';' will be cut off.
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

  ## Remove tailing ";":
  sql_statement <- gsub("\\;.*", "", sql_statement)

  ## Aavoid sql-injection:
  ## https://db.rstudio.com/best-practices/run-queries-safely/
  sql <- DBI::sqlInterpolate(conn = db_con, sql = sql_statement)

  # Return data as data.table
  outdat <-
    data.table::data.table(RPostgres::dbGetQuery(db_con, sql),
                           stringsAsFactors = TRUE)
  return(outdat)
}
