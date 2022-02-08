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

#' @title Assign variables to the system environment.
#' @description Create a system environment variable with the use of variables.
#'   While `var.name = "testname"; var.value = 7` and
#'   `Sys.setenv(var.name = var.value)` will create
#'   `var.name = 7` in the system environment,
#'   `DIZutils::setenv2(key = var.name, val = var.value)` will create
#'   `testname = 7` in the system environment.
#'
#' @inheritParams DIZtools::setenv2
#'
#' @return No return value, called for side effects (see description).
#' @seealso \url{https://stackoverflow.com/a/12533155}
#' @examples
#'   var.name = "testname"
#'   var.value = 7
#'
#'   Sys.setenv(var.name = var.value)
#'
#'   Sys.getenv("testname")
#'   #> [1] ""
#'   Sys.getenv("var.name")
#'   #> [1] "7"
#'
#'   Sys.unsetenv("var.name")
#'   Sys.unsetenv("testname")
#'
#'   DIZutils::setenv2(key = var.name, val = var.value)
#'   Sys.getenv("testname")
#'   #> [1] "7"
#'   Sys.getenv("var.name")
#'   #> [1] ""
#'
#' @export
#'
setenv2 <- function(key, val) {
  # function is required by DQAstats, DQAgui, miRacumDQA
  DIZtools::setenv2(key = key, val = val)
}
