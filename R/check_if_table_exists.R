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

#' @title Check if a given table name exists
#'
#' @description See title.
#'
#' @param db_con A DBI database connection. See `db_connection()` for details.
#' @param table_name (String) The name of the table or view to be checked.
#' @return True, if the table exists, false otherwise.
#' @examples
#' \dontrun{
#' res <- DIZutils::check_if_table_exists(
#'   db_con = DIZutils::db_connection(...),
#'   table_name = "my_table"
#' )}
#'
#' @export
#'
check_if_table_exists <- function(db_con, table_name) {
  stopifnot(!is.null(db_con), !is.null(table_name))

  # sql <- paste0("SELECT EXISTS(
  #              SELECT
  #              FROM information_schema.tables
  #              WHERE",
  #                 # " table_schema = '" , table_schema, "'
  #                 " table_name = '" , table_name, "'
  #          )")

  sql <- paste0("SELECT * FROM information_schema.tables",
                " WHERE table_name = '",
                table_name,
                "'")



  ## Avoid sql-injection:
  ## https://db.rstudio.com/best-practices/run-queries-safely/
  sql <- DBI::sqlInterpolate(conn = db_con, sql = sql)

  # Return data as data.table
  outdat <-
    data.table::data.table(RPostgres::dbGetQuery(db_con, sql),
                           stringsAsFactors = TRUE)
  if (nrow(outdat) == 1) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
