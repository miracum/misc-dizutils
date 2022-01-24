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

#' @title clean_path_name helper function
#'
#' @description Function to clean paths to surely have a tailing slash or not
#'
#' @param pathname A character string. A path name to be cleaned
#'   (to have a tailing slash or not).
#' @param remove.slash (boolean) Default: FALSE. Should the result
#'   contain the tailing slash or remove it?
#' @return The result is the input but with an tailing slash.
#'
#'
#' @examples
#' # Both function calls will return "home/test/"
#' clean_path_name("home/test")
#' clean_path_name("home/test/")
#'
#' @export
#'
clean_path_name <- function(pathname, remove.slash = FALSE) {
  if (remove.slash) {
    return(gsub("\\/$", "", pathname))
  } else {
    return(gsub("([[:alnum:]])$", "\\1/", pathname))
  }
}
