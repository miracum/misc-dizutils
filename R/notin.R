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

#' @title notin helper function
#'
#' @description Function to return elements of x that are not in y.
#'
#' @param x Object 1.
#' @param y Object 2.
#' @return Returns the result of !%in%(x,y)
#' @examples
#' tmp1 <- c("a","b","c")
#' tmp2 <- c("b", "c", "d")
#' tmp1 %notin% tmp2
#' @export
# define %notin% function
# nolint start
"%notin%" <- function(x, y) {
  # workaround until DIZutils is on CRAN
  # (when using 'importFrom DIZutils %notin%', error exists due to
  # referencing package in NAMESPACE but not as Import in DESCRIPTION)
  # "%notin%" <- utils::getFromNamespace(
  #   x = "%notin%",
  #   ns = "DIZutils"
  # )
  return(!("%in%"(x, y)))
}
# nolint end
