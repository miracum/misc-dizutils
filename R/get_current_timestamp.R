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

#' @title Quickly get the current timestamp
#'
#' @description Function to quickly get the current timestamp without
#'   need to handle format-options etc.
#'
#' @param no_spaces Boolean. Default = `FALSE`. Specifies wether the output
#'   can contain spaces or not. E.g. if the output is for human reading,
#'   `no_spaces = FALSE` is a good option. As suffix for filenames
#'   (e.g. logfiles), `no_spaces = TRUE` might be a good option.
#' @return The current timestamp in always the same format.
#'#'
#' @examples
#' get_current_timestamp(no_spaces = TRUE)
#' # Result: "2020-12-03-134354"
#' get_current_timestamp()
#' # this is the same like
#' get_current_timestamp(no_spaces = FALSE)
#' # Result: "03.12.2020 - 13:43 UTC"
#'
#' @export
#'
get_current_timestamp <- function(no_spaces = FALSE) {
  if (no_spaces) {
    return(format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
  } else {
    return(format(Sys.time(), format = "%d.%m.%Y - %H:%M UTC"))
  }
}
