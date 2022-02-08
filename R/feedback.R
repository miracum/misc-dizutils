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

#' @title Function to feedback messages either to the user and/or to the
#'   console and to the logfile.
#' @description This function provides the functionality to publish
#'   any kind of information to the user, the console and/or to the logfile.
#'   This might be a simple info, a warning or an error.
#'   The function can be used to select the output (console, ui, logfile).
#'   If no output is selected, the print_this string will be printed to the
#'   console and to logfile.
#'   One of these must be a string with length > 0: print_me, console, ui
#'
#' @inheritParams DIZtools::feedback
#'
#' @return No return value, called for publishing a message.
#' @examples
#' feedback(
#'   print_this = "This is an error message you can provide",
#'   type = "Error",
#'   findme = "215bb3695c",
#'   logfile_dir = tempdir(),
#'   headless = TRUE
#' )
#'
#' @export
#'
feedback <-
  function(print_this = "",
           type = "Info",
           ui = FALSE,
           console = TRUE,
           logfile = TRUE,
           logjs = FALSE,
           prefix = "",
           suffix = "",
           findme = "",
           logfile_dir = tempdir(),
           headless = TRUE) {
    # function is required by DQAstats
    DIZtools::feedback(
      print_this = print_this,
      type = type,
      ui = ui,
      console = console,
      logfile = logfile,
      logjs = logjs,
      prefix = prefix,
      suffix = suffix,
      findme = findme,
      logfile_dir = logfile_dir,
      headless = headless
    )
  }

#' @title Archives the current logfile and creates a new blank one.
#' @description  This function is called once at the beginning of the
#'   runtime of the tool. It checks whether there is an old logfile
#'   and renames it (if existing) to "logfile_20xx-xx-xx-xxxxxx.log".
#'   Then a new, empty, logfile "logfile.log" is created.
#'
#' @importFrom magrittr "%>%"
#'
#' @inheritParams DIZtools::cleanup_old_logfile
#'
#' @return No return value, called for side effects (see description)
#' @examples
#' cleanup_old_logfile("path/to/logfile/dir/")
#'
#' @export
#'
cleanup_old_logfile <- function(logfile_dir) {
  # function is required by DQAstats
  DIZtools::cleanup_old_logfile(logfile_dir = logfile_dir)
}
