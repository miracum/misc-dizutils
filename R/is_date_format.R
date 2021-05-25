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

#' @title Checks if a string matches a given date format.
#'
#' @description Checks if a string matches a given date format.
#'
#' @param date The list applied from rv$restricting_date
#' @param format The format paramters. See `?strptime` for parameter infos.
#'
#' @return TRUE/FALSE
#'
#' @export
#'
is_date_format <- function(date, format) {
  formatted = try(as.Date(date, format), silent = TRUE)
  return(DIZutils::equals2(as.character(formatted), date))
}
