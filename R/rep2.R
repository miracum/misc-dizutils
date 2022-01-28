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

#' @title Repeat something with the ability to also collapse the output.
#' @description Repeat something with the ability to also collapse the output.
#'   The base `rep("ha", 3)` function does not support arguments like
#'   `collapse` or `sep` like `paste(...)`. `rep2` closes this gap.
#'
#' @param x The object to repeat
#' @param n The amount how often the object should be repeated
#' @inheritParams paste
#'
#' @return The result from
#'   `paste(rep(x, n), sep = sep, collapse = collapse)`
#' @examples
#'   ## rep2 is the same like rep:
#'   rep(x = "ha", 3)
#'   #> "ha" "ha" "ha"
#'   DIZutils::rep2(x = "ha", 3)
#'   #> "ha" "ha" "ha"
#'
#'   ## ... but you can also use the arguments from `paste`:
#'   DIZutils::rep2(x = "ha", n = 3, collapse = "")
#'   #> "hahaha"
#'
#' @export
#'
rep2 <- function(x, n, ...) {
  return(paste(rep(x, n), ...))
}
