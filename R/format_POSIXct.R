# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2021 Universitätsklinikum Erlangen, Germany
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
#' @param x The POSIXct timestamp or a string to be automatically
#'   converted to a POSIXct timestamp.
#' @param lang (Optional, String, Default = "en") The language of the result.
#'   Currently implemented: "en"/"de". If you supply another not yet
#'   implemented language here, "en" will be chosen automatically.
#' @param date (Optional, Boolean, Default = TRUE) Should the date be part
#'   of the result string?
#' @param time (Optional, Boolean, Default = TRUE) Should the time be part
#'   of the result string?
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
format_POSIXct <- function(x,
                           lang = "en",
                           date = TRUE,
                           time = TRUE) {
  x <- parsedate::parse_date(dates = x, approx = FALSE)
  res <- ""
  seperator <- ", "
  if (lang == "de") {
    if (date) {
      res <- format(x = x, format = "%d.%m.%Y")
    }
    if (date && time) {
      res <- paste0(res, seperator)
    }
    if (time) {
      res <- paste0(res, format(x = x, format = "%H:%M:%S"))
    }
  } else {
    ## Default: Lang = "en" (or anything not-defined)
    if (date) {
      res <- format(x = x, format = "%Y-%m-%d")
    }
    if (date && time) {
      res <- paste0(res, seperator)
    }
    if (time) {
      res <- paste0(res, format(x = x, format = "%H:%M:%S"))
    }
  }
  return(res)
}
