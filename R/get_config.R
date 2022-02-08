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

#' @title get_config helper function
#'
#' @description Internal function to read config files
#'
#' @inheritParams DIZtools::get_config
#'
#' @return If successful it returns the config, Null otherwise.
#' @examples
#' \donttest{
#' utils_path <- tempdir()
#' config <- get_config(
#'   config_file = paste0(utils_path, "/MISC/email.yml"),
#'   config_key = "email"
#' )}
#'
#' @export
#'
get_config <-
  function(config_file,
           config_key) {
    .Deprecated("DIZtools::get_config")
    DIZtools::get_config(
      config_file = config_file,
      config_key = config_key
    ) %>%
      return()
  }
