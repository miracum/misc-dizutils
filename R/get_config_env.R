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

#' @title get_config_env helper function
#'
#' @description Internal function to read settings for a certain system
#'   from the environment.
#'   IMPORTANT: If yout want to get any result with your input as prefix,
#'   use `ignore_presets = TRUE`! See param-definition for more details.
#'   This function will look at uppercase system_names at default.
#'
#' @param system_name The name of the system (This is also the prefix used
#'   to get the environment variables with 'SYSTEM_KEY', e.g. 'I2B2_DBNAME').
#'   This function also works if there are multiple instances like
#'   `I2B2_1_DBNAME` and `I2B2_2_DBNAME`. Then the result will contain
#'   nested lists for each occurence.
#' @param ignore_presets (boolean, default = FALSE)
#'   Only return something if all elements
#'   from the presets are found? These are currently `host`, `port`, `user`,
#'   `password`, `sid`, `path`. If you have another suffix after
#'   `system_name` in your config file, you won't see it here. To see
#'   everything with prefix `system_name` simply set `ignore_presets = TRUE`.
#'   To obtain a list of current default elements, run
#'   \code{DIZutils:::get_default_config_elements()}.
#' @param uppercase_system (boolean) Default: True. Otherwise: case-sensitive.
#'
#' @inheritParams db_connection
#' @return If successful it returns the config, null otherwise.
#' @examples
#' \donttest{
#' get_config_env(
#'   system_name = "i2b2",
#'   logfile_dir = tempdir(),
#'   headless = FALSE
#' )}
#'
#' @export
#'
get_config_env <-
  function(system_name,
           logfile_dir = tempdir(),
           headless = TRUE,
           ignore_presets = FALSE,
           uppercase_system = TRUE) {
    separator <- "_"

    ## Helper functions:
    get_values_from_env <-
      function(system_name, separator, elements) {
        return(as.list(sapply(
          X = elements,
          FUN = function(name) {
            return(Sys.getenv(paste0(system_name, separator, name)))
          },
          USE.NAMES = TRUE
        )))
      }

    get_elements_from_env <-
      function(system_name = system_name,
               separator = separator) {
        prefix <- paste0("^(", system_name, separator, ")")
        pattern <- paste0(prefix, "([A-Za-z])+$")
        elements <-
          grep(pattern = pattern,
               x = names(Sys.getenv()),
               value = TRUE)
        elements <- gsub(pattern = prefix,
                         replacement = "",
                         x = elements)
        return(elements)
      }

    ## The main work:
    res <- tryCatch({
      if (uppercase_system) {
        system_name <- toupper(system_name)
      }

      if (ignore_presets) {
        elements <-
          get_elements_from_env(system_name = system_name, separator = separator)
      } else {
        elements <- get_default_config_elements()
      }

      ## First try to get all settings for the system with the assumption that
      ## there is no nesting:
      ## Get the environment variable for each all keys:
      res <-
        get_values_from_env(system_name = system_name,
                            separator = separator,
                            elements = elements)

      ## Now remove the empty entries:
      res <- res[lapply(res, nchar) > 0]

      ## If nothing is left, there might be nesting or really no content:
      if (length(res) == 0) {
        ## Maybe there are multiple instances of these settings:
        env_names <- names(Sys.getenv())
        sub_elements <-
          unique(gsub(
            pattern = paste0("(", separator, ")([A-Za-z])+$"),
            replacement = "",
            x = env_names[grepl(pattern = paste0("^(",
                                                 system_name,
                                                 separator,
                                                 ")([0-9])+"),
                                x = env_names)]
          ))
        if (length(sub_elements) > 0) {
          res <- lapply(
            X = sub_elements,
            FUN = function(x) {
              if (ignore_presets) {
                elements <-
                  get_elements_from_env(system_name = x, separator = separator)
              } else {
                elements <- get_default_config_elements()
              }
              tmp <- get_values_from_env(
                system_name = x,
                separator = separator,
                elements = elements
              )

              ## Remove empty entries:
              tmp <-  tmp[lapply(tmp, nchar) > 0]

              ## Lowercase all names:
              names(tmp) <- tolower(names(tmp))

              return(tmp)
            }
          )
          res[["nested"]] <- TRUE
        }
      }

      ## Lowercase all names:
      names(res) <- tolower(names(res))

      # Finally finish:
      return(res)
    },
    error = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      DIZtools::feedback(
        print_this = paste0("Error in 'get_config_env()'. ", cond),
        type = "Error",
        findme = "83a71e6153",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    },
    warning = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      DIZtools::feedback(
        print_this = paste0("Warning in 'get_config_env()'. ", cond),
        type = "Warning",
        findme = "586b76a724",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    })
    return(res)
  }

#' @title Get default element names (suffixes) for env reading
#'
#' @description Internal function.
#'   Get default element names (suffixes) for env reading
#'
#' @return Vector with default elements
#'
get_default_config_elements <- function() {
  return(c(
    "DBNAME",
    "HOST",
    "PORT",
    "USER",
    "PASSWORD",
    "SID",
    "PATH",
    "DISPLAYNAME"
  ))
}
