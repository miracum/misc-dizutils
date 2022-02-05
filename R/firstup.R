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

#' @title Converts the first letter of the input string to uppercase
#' @description Converts the first letter of the input string to uppercase
#'
#' @inheritParams DIZtools::firstup
#'
#' @return Returns the input string but with a capital first letter.
#' @examples
#' firstup("first letter of this string will be upper case as return")
#'
#' @export
#'
firstup <- function(x) {
  DIZtools::firstup(x = x) %>%
    return()
}
