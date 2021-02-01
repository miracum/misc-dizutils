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

#' @title Quickly get all currently implemented database systems
#'
#' @description Function to quickly get the currently implemented database
#'   systems
#'
#' @return The currently implemented database systems as string array.
#'   `E.g. c("postgres", "oracle")`
#'#'
#' @examples
#' get_db_systems()
#' # Result: c("postgres", "oracle")
#'
#' @export
#'
get_db_systems <- function() {
  return(c("postgres", "oracle"))
}
