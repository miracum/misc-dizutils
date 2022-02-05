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

#' @title Clean string with a given set of replacements
#' @description This function provides the functionality to clean a string
#'   with a given set of replacements. This is e.g. useful to create
#'   filenames or paths that are not allowed to contain spaces.
#'
#' @inheritParams DIZtools::string_replacements
#'
#' @return (String) All elements (names) of the input `replace_mapping` or
#'   the default mapping are replaced by its values of the mapping.
#'
#' @examples
#' string_replacements(input = "Ab 20. April 2020 (((___((N = 1.234)")
#' # Result: "Ab_20_April_2020_N_1234"
#'
#' @export
#'
string_replacements <-
  function(input,
           replace_mapping = "default",
           tolower = FALSE,
           toupper = FALSE) {
    DIZtools::string_replacements(
      input = input,
      replace_mapping = replace_mapping,
      tolower = tolower,
      toupper = toupper
    ) %>%
      return()
  }
