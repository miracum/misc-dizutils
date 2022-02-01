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

#' @title query_database helper function
#'
#' @description Internal function to query the database. The function
#'   sends a sql statement to the database and returns a data.table.
#'
#' @param db_con A DBI database connection.
#' @param sql_statement A character string containing a valid SQL statement.
#'   Caution: Everything after the first ';' will be cut off.
#' @param no_result (boolean, default: FALSE) Is the sql meant to return
#'   nothing? E.g. if you just insert or update a table.
#'   Then supply `TRUE` here. If you supply `FALSE` here, the
#'   function expects to receive a result table and tries to convert it
#'   to a data.table.
#' @param close_connection (boolean, default = FALSE). If TRUE, the connection
#'   will be closed after the query was sent and the result received.
#' @return Returns the result of the db-query. If `no_result` is `TRUE`,
#'  the return value will be `TRUE` if the query was successfully sent.
#'  Otherwise (if `no_result` is `FALSE` which is the default), the result
#'  will be the result of the sql query as data.table.
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
#' )
#'
#' query_database(
#'   db_con = db_con,
#'   sql_statement = "INSERT INTO table_name DEFAULT VALUES;",
#'   no_result = TRUE
#' )
#'
#' }
#'
#' @export
#'
# query_database
query_database <-
  function(db_con,
           sql_statement,
           no_result = FALSE,
           close_connection = FALSE) {
    stopifnot(!is.null(sql_statement), !is.null(db_con))

    ## Remove tailing ";":
    sql_statement <- gsub("\\;.*", "", sql_statement)

    ## Aavoid sql-injection:
    ## https://db.rstudio.com/best-practices/run-queries-safely/
    sql <- DBI::sqlInterpolate(conn = db_con, sql = sql_statement)

    if (no_result) {
      RPostgres::dbSendQuery(conn = db_con, statement = sql)
      return(TRUE)
    } else {
      # Return data as data.table
      return(data.table::data.table(
        RPostgres::dbGetQuery(conn = db_con, statement = sql),
        stringsAsFactors = TRUE
      ))
    }
    if (close_connection) {
      close_connection(conn = db_con)
    }
  }
