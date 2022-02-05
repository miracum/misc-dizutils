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

#' @title Clean the console and environment-variables
#'
#' @description Function to clean the local environment.
#'   The call of this function clears the console and the local environment
#'   variables.
#'
#' @inheritParams DIZtools::clear
#'
#' @return Nothing.
#'
#' @export
#'
clear <- function(keep_environment = FALSE,
                  keep_console = FALSE) {
  DIZtools::clear(
    keep_environment = keep_environment,
    keep_console = keep_console
  )
}
