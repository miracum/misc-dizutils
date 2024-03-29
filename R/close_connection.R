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

#' @title close_connection helper function
#'
#' @description Internal function to close the database connection. The function
#'   is just a wrapper around `RPostgres::dbDisconnect`
#'
#' @param conn A DBI database connection.
#'
#' @return The function is just a wrapper around RPostgres::dbDisconnect /
#'   DBI::dbDisconnect and does not return any value.
#'
#' @examples
#' \dontrun{
#' db_con <- DIZutils::db_connection(
#'   db_name = "i2b2",
#'   db_type = "postgres"
#' )
#'
#' DIZutils::close_connection(
#'   conn = db_con
#' )
#' }
#'
#' @export
#'
# close_connection
close_connection <- function(conn) {
  stopifnot(!is.null(conn))
  RPostgres::dbDisconnect(conn = conn)
}
