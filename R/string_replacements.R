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

#' @title Clean string with a given set of replacements
#' @description This function provides the functionality to clean a string
#'   with a given set of replacements. This is e.g. useful to create
#'   filenames or paths that are not allowed to contain spaces.
#' @param input (string) The character string to be processed.
#' @param replace_mapping (Optional, list, default = "default") The mapping
#'   containing what should be replaced with what:
#'   `replace_mapping <- list("replace_this" = "with_this")`
#' @param tolower (boolean, default = FALSE) Should the result be lowercase?
#' @param toupper (boolean, default = FALSE) Should the result be uppercase?
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
    res <- input
    replaceme <- list(
      # "replace_this" = "with_this",
      "(" = "",
      ")" = "",
      "{" = "",
      "}" = "",
      "." = "",
      " " = "_",
      "=" = "",
      "__" = "_"
    )

    if (is.list(replace_mapping)) {
      ## Use the mapping handed over to the function:
      replaceme <- replace_mapping
    } else if (replace_mapping == "default") {
      replaceme <- replaceme
    } else {
      DIZutils::feedback(
        print_this = paste0(
          "There is something handed over as `replace_mapping`",
          " which is not a list. Using default replacement instead."
        ),
        type = "Warning",
        findme = "7c9d35cd88"
      )
    }

    iteration <- 0
    finished_changing <- FALSE
    while (iteration < 1000 && !finished_changing) {
      finished_changing <- TRUE
      for (replace_this in names(replaceme)) {
        res <-
          gsub(
            pattern = replace_this,
            replacement = replaceme[[replace_this]],
            x = res,
            fixed = TRUE
          )
      }
      for (replace_this in names(replaceme)) {
        ## Check if there is still something left to change:
        if (grepl(pattern = replace_this,
                  x = res,
                  fixed = TRUE)) {
          ## There is a character left which needs to be changed,
          ## so this loop will be computed again.
          finished_changing <- FALSE
        }
      }
      iteration <- iteration + 1
    }

    if (tolower) {
      res <- tolower(res)
    } else if (toupper) {
      res <- toupper(res)
    }

    return(res)
  }
