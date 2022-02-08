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

#' @title Formats a given POSIXct timestamp without the need of manually
#'   specifing format parameters.
#'
#' @description See title.
#'
#' @inheritParams DIZtools::format_posixct
#'
#' @return (String) The formatted timestamp as a string.
#' @examples
#' \dontrun{
#' format_POSIXct(x = "2021-12-31 12:34")
#' ## Result: "2021-12-31, 12:34:00"
#' format_POSIXct(x = "2021-12-31 12:34", lang = "de")
#' ## Result: "31.12.2021, 12:34:00"
#' )}
#'
#' @export
#'
format_posixct <- function(x,
                           lang = "en",
                           date = TRUE,
                           time = TRUE) {
  # function is required by DQAstats
  DIZtools::format_posixct(
    x = x,
    lang = lang,
    date = date,
    time = time
  ) %>%
    return()
}
