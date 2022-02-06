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

#' @title Compare two elements and return true if both elements are the same.
#'
#' @description The base-R function `==` is not working in an intended
#'   way for NAs and boolean. This function fixes this.
#'
#' @references <http://www.cookbook-r.com/Manipulating_data/
#'   Comparing_vectors_or_factors_with_NA/>
#'
#' @inheritParams DIZtools::equals2
#'
#' @return The equality between both vectors.
#'
#' @examples
#' \dontrun{
#'   dt <-
#'     data.table::data.table(
#'       a = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, NA, NA, NA),
#'       b = c(TRUE, FALSE, NA, TRUE, FALSE, NA, TRUE, FALSE, NA)
#'     )
#'   dt[, "classic_result" := get("a") == get("b")]
#'   dt[, "result_expected" := equals2(get("a"), get("b"))]
#'   dt
#'   ## This is the result:
#'   # a     b classic_result result_expected
#'   # 1:  TRUE  TRUE           TRUE            TRUE
#'   # 2:  TRUE FALSE          FALSE           FALSE
#'   # 3:  TRUE    NA             NA           FALSE
#'   # 4: FALSE  TRUE          FALSE           FALSE
#'   # 5: FALSE FALSE           TRUE            TRUE
#'   # 6: FALSE    NA             NA           FALSE
#'   # 7:    NA  TRUE             NA           FALSE
#'   # 8:    NA FALSE             NA           FALSE
#'   # 9:    NA    NA             NA            TRUE
#' }
#'
#' @export
#'
equals2 <- function(v1, v2) {
  .Deprecated("DIZtools::equals2")
  DIZtools::equals2(
    v1 = v1,
    v2 = v2
  ) %>%
    return()
}
