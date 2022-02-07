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

#' @title Get the difference of two vectors in both directions.
#'
#' @description The base-R function `setdiff` is asymmetric meaning
#'   `setdiff(vec1, vec2)` is not the same as `setdiff(vec2, vec1)`.
#'   Only the first vector will be compared to the second vector and all
#'   elements not contained in the second are in the resulting vector.
#'   So if you also want in include all elements being in the second vector
#'   but not in the first, you can use this function. In this case you are
#'   searching for elements beeing in the union of both vectors but not
#'   in the intersect of both vectors. This function is a symmetric function.
#'   It doesn't matter in which order you input the vectors, the content
#'   will be the same. Only the order of the elements inside the output
#'   differs.
#'
#' @inheritParams DIZtools::setdiff_all
#'
#' @return The difference between both vectors.
#'
#' @examples
#' \dontrun{
#' vec1 <- c(1,2,3,4)
#' vec2 <- c(3,4,5,6)
#' # setdiff(vec1, vec2) = c(1,2)
#' # setdiff(vec2, vec1) = c(5,6)
#' # setdiff_all(vec1, vec2) = c(1,2,5,6)
#' # setdiff_all(vec2, vec1) = c(5,6,1,2)
#' }
#'
#' @export
#'
setdiff_all <- function(vec1, vec2) {
  .Deprecated("DIZtools::setdiff_all()")
  DIZtools::setdiff_all(
    vec1 = vec1,
    vec2 = vec2
  ) %>%
    return()
}
