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

#' @title get_config helper function
#'
#' @description Internal function to read config files
#'
#' @param config_file A character string. The path to the config.yml-file
#'   containing the database configuration.
#' @param config_key A character string. The name of the corresponding
#'   database. This string must be conform with the corresponding config
#'   section in the config.yml-file.
#'
#' @inheritParams feedback
#' @return If successful it returns the config, Null otherwise.
#' @examples
#' \donttest{
#' utils_path <- tempdir()
#' config <- get_config(
#'   config_file = paste0(utils_path, "/MISC/email.yml"),
#'   config_key = "email",
#'   logfile_dir = tempdir(),
#'   headless = TRUE
#' )}
#'
#' @export
#'
get_config <-
  function(config_file,
           config_key,
           logfile_dir,
           headless) {
    res <- tryCatch({
      config::get(config_key, file = config_file)
    },
    error = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Cannot access config_file. ", cond),
        type = "Error",
        findme = "e3e1b9c5f9",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    },
    warning = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Cannot access config_file. ", cond),
        type = "Warning",
        findme = "718e0f3d88",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    })
    return(res)
  }
