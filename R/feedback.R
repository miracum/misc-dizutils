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
#' @param print_this (Optional, String, default: "")
#' @param type (Optional, String, default: "Info")
#'   E.g. "Warning", "Error". Default: "Info"
#' @param ui (Optional, Boolean/String, default: FALSE)
#'   If true, the message will also be printed to the user in form of a modal.
#'   Can also be a string.
#' @param console (Optional, Boolean/String, default: TRUE)
#'   If true, the message will also be printed to the console as is.
#'   Can also be a string.
#' @param logfile (Optional, Boolean, default: TRUE)
#'   If true (default) the print_this string will also be printed
#'   to the console.
#' @param logjs (Optional, Boolean, default: FALSE)
#'   If true (default: false) the print_this
#'   string will also be printed to the javascript-console.
#'   This only makes sense, if the gui is active.
#' @param prefix Prefix (Optional, String, default: "")
#'   This is useful if print_this is an array/list.
#'   Each entry will then be new row with this prefix.
#' @param suffix Suffix (Optional, String, default: "")
#'   Same like prefix but at the end of each line.
#' @param findme (Optional, String, default: "")
#'   Recommended with length 10.
#'   String to find the message in the code.
#'   E.g. 10-digit random hex from
#'   (<https://www.browserling.com/tools/random-hex>) or
#'   (<https://onlinerandomtools.com/generate-random-hexadecimal-numbers>)
#' @param logfile_dir (Optional, String, default: "tempdir()")
#'   The absolute path to folder where the logfile will be stored.
#' @param headless (Optional, Boolean, default: TRUE)
#'   Indicating, if the function is run only in the console (headless = TRUE)
#'   or on a GUI frontend (headless = FALSE).
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
      logfile_dir = logfile,
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
#' @import DIZtools
#'
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#' @examples
#' cleanup_old_logfile("path/to/logfile/dir/")
#'
#' @export
#'
cleanup_old_logfile <- function(logfile_dir) {
  DIZtools::cleanup_old_logfile(logfile_dir = logfile_dir)
}
